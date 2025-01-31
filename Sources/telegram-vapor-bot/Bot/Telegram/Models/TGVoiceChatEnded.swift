// Telegram-vapor-bot - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.

/**
 This object represents a service message about a voice chat ended in the chat.

 SeeAlso Telegram Bot API Reference:
 [VoiceChatEnded](https://core.telegram.org/bots/api#voicechatended)
 */
public final class TGVoiceChatEnded: Codable {

    /// Custom keys for coding/decoding `VoiceChatEnded` struct
    public enum CodingKeys: String, CodingKey {
        case duration = "duration"
    }

    /// Voice chat duration; in seconds
    public var duration: Int

    public init (duration: Int) {
        self.duration = duration
    }
}
