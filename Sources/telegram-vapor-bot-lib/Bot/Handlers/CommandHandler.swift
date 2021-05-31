//
//  CommandHandler.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 21.04.2018.
//

/**
 Handler class to handle Telegram commands.

 Commands are Telegram messages that start with /, optionally followed by an @ and the bot’s name
 and/or some additional text.

 - Options of this handler
 - `editedUpdates` Determines whether the handler should also accept edited messages.

 */
public class TGCommandHandler: TGHandlerPrtcl {

    public var id: Int = 0
    
    public var name: String

    public struct Options: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        /// Determines Whether the handler should also accept edited messages. Not used by default.
        public static let editedUpdates = Options(rawValue: 1)
    }

    let commands: Set<String>
    let callback: TGHandlerCallback
    let filters: Filters
    let options: Options
    let botUsername: String?

    public init(
        name: String = String(describing: TGCommandHandler.self),
        commands: [String],
        filters: Filters = .all,
        options: Options = [],
        botUsername: String? = nil,
        callback: @escaping TGHandlerCallback
    ) {
        self.name = name
        self.commands = Set(commands)
        self.filters = filters
        self.options = options
        self.botUsername = botUsername
        self.callback = callback
    }

    public func check(update: TGUpdate) -> Bool {
        if options.contains(.editedUpdates),
            update.editedMessage != nil ||
                update.editedChannelPost != nil {
            return true
        }

        guard let message = update.message,
            filters.check(message),
            let text = message.text,
            let entities = message.entities else { return false }

        let types = entities.compactMap { (entity) -> String? in
            let start = text.index(text.startIndex, offsetBy: entity.offset)
            let end = text.index(start, offsetBy: entity.length-1)
            let command = text[start...end]
            // If the user specifies the bot using "@"
            // and `botUsername` is not nil,
            // check the bot name and then ignore it for further match.
            let split = command.split(separator: "@")
            if split.count == 2,
                let username = botUsername {
                let commandWithoutMention = split[0]
                let specifiedBot = split[1]
                return specifiedBot == username
                    ? String(commandWithoutMention) : nil
            } else {
                return String(command)
            }
        }
        return !commands.intersection(types).isEmpty
    }

    public func handle(update: TGUpdate, bot: TGBotPrtcl) {
        do {
            try callback(update, bot)
        } catch {
            log.error(error.logMessage)
        }
    }
}
