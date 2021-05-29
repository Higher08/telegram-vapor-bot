// Telegram-vapor-bot-lib - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.

/**
 This object represents a unique message identifier.

 SeeAlso Telegram Bot API Reference:
 [MessageId](https://core.telegram.org/bots/api#messageid)
 */
public final class MessageId: Codable {

    /// Custom keys for coding/decoding `MessageId` struct
    public enum CodingKeys: String, CodingKey {
        case messageId = "message_id"
    }

    /// Unique message identifier
    public var messageId: Int

    public init (messageId: Int) {
        self.messageId = messageId
    }
}
