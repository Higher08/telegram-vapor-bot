// Telegram-vapor-bot-lib - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.

/**
 This object represents a general file (as opposed to photos, voice messages and audio files).

 SeeAlso Telegram Bot API Reference:
 [Document](https://core.telegram.org/bots/api#document)
 */
public final class Document: Codable {

    /// Custom keys for coding/decoding `Document` struct
    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case thumb = "thumb"
        case fileName = "file_name"
        case mimeType = "mime_type"
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public var fileId: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var fileUniqueId: String

    /// Optional. Document thumbnail as defined by sender
    public var thumb: PhotoSize?

    /// Optional. Original filename as defined by sender
    public var fileName: String?

    /// Optional. MIME type of the file as defined by sender
    public var mimeType: String?

    /// Optional. File size
    public var fileSize: Int?

    public init (fileId: String, fileUniqueId: String, thumb: PhotoSize? = nil, fileName: String? = nil, mimeType: String? = nil, fileSize: Int? = nil) {
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.thumb = thumb
        self.fileName = fileName
        self.mimeType = mimeType
        self.fileSize = fileSize
    }
}
