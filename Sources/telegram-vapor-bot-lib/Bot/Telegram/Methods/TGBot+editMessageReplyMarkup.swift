// Telegram-vapor-bot-lib - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.

import Vapor

public extension TGBot {

    /// Parameters container struct for `editMessageReplyMarkup` method
    struct EditMessageReplyMarkupParams: Encodable {

        /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
        var chatId: ChatId?

        /// Required if inline_message_id is not specified. Identifier of the message to edit
        var messageId: Int?

        /// Required if chat_id and message_id are not specified. Identifier of the inline message
        var inlineMessageId: String?

        /// A JSON-serialized object for an inline keyboard.
        var replyMarkup: InlineKeyboardMarkup?

        /// Custom keys for coding/decoding `EditMessageReplyMarkupParams` struct
        enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
            case replyMarkup = "reply_markup"
        }

        public init(chatId: ChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, replyMarkup: InlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
            self.replyMarkup = replyMarkup
        }
    }

    /**
     Use this method to edit only the reply markup of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.

     SeeAlso Telegram Bot API Reference:
     [EditMessageReplyMarkupParams](https://core.telegram.org/bots/api#editmessagereplymarkup)
     
     - Parameters:
         - params: Parameters container, see `EditMessageReplyMarkupParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `MessageOrBool` type
     */
    @discardableResult
    func editMessageReplyMarkup(params: EditMessageReplyMarkupParams? = nil) throws -> EventLoopFuture<MessageOrBool> {
        let methodURL: URI = .init(string: getMethodURL("editMessageReplyMarkup"))
        let future: EventLoopFuture<MessageOrBool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
