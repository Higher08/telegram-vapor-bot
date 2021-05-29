// Telegram-vapor-bot-lib - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.

import Vapor

public extension TGBot {

    /// Parameters container struct for `setStickerPositionInSet` method
    struct SetStickerPositionInSetParams: Encodable {

        /// File identifier of the sticker
        var sticker: String

        /// New sticker position in the set, zero-based
        var position: Int

        /// Custom keys for coding/decoding `SetStickerPositionInSetParams` struct
        enum CodingKeys: String, CodingKey {
            case sticker = "sticker"
            case position = "position"
        }

        public init(sticker: String, position: Int) {
            self.sticker = sticker
            self.position = position
        }
    }

    /**
     Use this method to move a sticker in a set created by the bot to a specific position. Returns True on success.

     SeeAlso Telegram Bot API Reference:
     [SetStickerPositionInSetParams](https://core.telegram.org/bots/api#setstickerpositioninset)
     
     - Parameters:
         - params: Parameters container, see `SetStickerPositionInSetParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `Bool` type
     */
    @discardableResult
    func setStickerPositionInSet(params: SetStickerPositionInSetParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("setStickerPositionInSet"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
