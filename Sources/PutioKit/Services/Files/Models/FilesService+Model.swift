//
//  FilesService+Model.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 05/03/2020.
//

import Foundation

public extension FilesService { enum Model {} }

public extension FilesService.Model {

    enum FileType: String, Codable, CustomStringConvertible {
        case folder = "FOLDER"
        case file = "FILE"
        case audio = "AUDIO"
        case video = "VIDEO"
        case image = "IMAGE"
        case archive = "ARCHIVE"
        case pdf = "PDF"
        case text = "TEXT"
        case swf = "SWF"

        public var description: String { rawValue }
    }
}

public extension FilesService.Model {

    enum SortBy: String, Codable, CustomStringConvertible {
        case nameAscending = "NAME_ASC"
        case nameDescending = "NAME_DESC"
        case sizeAscending = "SIZE_ASC"
        case sizeDescending = "SIZE_DESC"
        case dateAscending = "DATE_ASC"
        case dateDescending = "DATE_DESC"
        case modifiedAscending = "MODIFIED_ASC"
        case modifiedDescending = "MODIFIED_DESC"

        public var description: String { rawValue }
    }
}

public extension FilesService.Model {

    struct File: Codable, Equatable, Hashable {

        public let createdAt: Date?
        public let updatedAt: Date?
        public let id: Int
        public let isMP4Available: Bool
        public let isShared: Bool
        public let name: String
        public let parentFolder: Int?
        public let screenshot: URL?
        public let type: FilesService.Model.FileType
        public let fileExtension: String?
        public let requiresConversion: Bool?
        public let size: Int
        public let mp4Size: Int?
        public let streamURL: URL?
        public let playlistURL: URL?

        func mutate(playlistURL: URL?) -> File {
            FilesService.Model.File(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                isMP4Available: isMP4Available,
                isShared: isShared,
                name: name,
                parentFolder: parentFolder,
                screenshot: screenshot,
                type: type,
                fileExtension: fileExtension,
                requiresConversion: requiresConversion,
                size: size,
                mp4Size: mp4Size,
                streamURL: streamURL,
                playlistURL: playlistURL)
        }

        private enum CodingKeys: String, CodingKey {

            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case id = "id"
            case isMP4Available = "is_mp4_available"
            case isShared = "is_shared"
            case name = "name"
            case parentFolder = "parent_id"
            case screenshot = "screenshot"
            case type = "file_type"
            case fileExtension = "extension"
            case requiresConversion = "need_convert"
            case size = "size"
            case mp4Size = "mp4_size"
            case streamURL = "stream_url"
            case playlistURL = "playlistURL"
        }
    }
}

public extension FilesService.Model {

    struct ListParameters: Codable, Equatable, Hashable, URLQueryItemConvertible {

        public let parentId: Int?
        public let perPage: Int?
        public let sortBy: FilesService.Model.SortBy?
        public let contentType: String?
        public let fileType: [FilesService.Model.FileType]?
        public let includeStreamURLInFiles: Bool
        public let includeStreamURLInParent: Bool
        public let includeMP4StreamURLInFiles: Bool
        public let includeMP4StreamURLInParent: Bool
        public let showHiddenFolders: Bool
        public let includeMP4Status: Bool

        public init(parentId: Int? = nil,
                    perPage: Int? = nil,
                    sortBy: FilesService.Model.SortBy? = nil,
                    contentType: String? = nil,
                    fileType: [FilesService.Model.FileType]? = nil,
                    includeStreamURLInFiles: Bool = true,
                    includeStreamURLInParent: Bool = true,
                    includeMP4StreamURLInFiles: Bool = true,
                    includeMP4StreamURLInParent: Bool = true,
                    showHiddenFolders: Bool = false,
                    includeMP4Status: Bool = true) {

            self.parentId = parentId
            self.perPage = perPage
            self.sortBy = sortBy
            self.contentType = contentType
            self.fileType = fileType
            self.includeStreamURLInFiles = includeStreamURLInFiles
            self.includeStreamURLInParent = includeStreamURLInParent
            self.includeMP4StreamURLInFiles = includeMP4StreamURLInFiles
            self.includeMP4StreamURLInParent = includeMP4StreamURLInParent
            self.showHiddenFolders = showHiddenFolders
            self.includeMP4Status = includeMP4Status
        }

        func asURLQueryItems() -> [URLQueryItem] {

            return CodingKeys.allCases.compactMap {
                switch $0 {
                    case .parentId: return transformIfNotNil(parentId, name: $0.rawValue)
                    case .perPage: return transformIfNotNil(perPage, name: $0.rawValue)
                    case .sortBy: return transformIfNotNil(sortBy, name: $0.rawValue)
                    case .contentType: return transformIfNotNil(contentType, name: $0.rawValue)
                    case .fileType: return transformIfNotNil(fileType, name: $0.rawValue)
                    case .includeStreamURLInFiles: return transformIfNotNil(includeStreamURLInFiles, name: $0.rawValue)
                    case .includeStreamURLInParent: return transformIfNotNil(includeStreamURLInParent, name: $0.rawValue)
                    case .includeMP4StreamURLInFiles: return transformIfNotNil(includeMP4StreamURLInFiles, name: $0.rawValue)
                    case .includeMP4StreamURLInParent: return transformIfNotNil(includeMP4StreamURLInParent, name: $0.rawValue)
                    case .showHiddenFolders: return transformIfNotNil(showHiddenFolders, name: $0.rawValue)
                    case .includeMP4Status: return transformIfNotNil(includeMP4Status, name: $0.rawValue)
                }
            }
        }

        private enum CodingKeys: String, CodingKey, CaseIterable {

            case parentId = "parent_id"
            case perPage = "per_page"
            case sortBy = "sort_by"
            case contentType = "content_type"
            case fileType = "file_type"
            case includeStreamURLInFiles = "stream_url"
            case includeStreamURLInParent = "stream_url_parent"
            case includeMP4StreamURLInFiles = "mp4_stream_url"
            case includeMP4StreamURLInParent = "mp4_stream_url_parent"
            case showHiddenFolders = "hidden"
            case includeMP4Status = "mp4_status"
        }
    }
}

public extension FilesService.Model {

    struct FetchedFiles: Codable, Equatable, Hashable {

        public let files: [FilesService.Model.File]
        public let parent: FilesService.Model.File?
        public let total: Int?
        public let cursor: String?
        public let status: String

        private enum CodingKeys: String, CodingKey {

            case files = "files"
            case parent = "parent"
            case total = "total"
            case cursor = "cursor"
            case status
        }
    }
}

extension FilesService.Model {

    struct _FetchedFile: Codable, Equatable, Hashable {

        public let file: FilesService.Model.File

        private enum CodingKeys: String, CodingKey { case file }
    }
}


public extension FilesService.Model {

    struct NextPageParameters: Codable, Equatable, Hashable, URLQueryItemConvertible {

        let cursor: String
        let perPage: Int?

        public init(cursor: String, perPage: Int? = nil) {
            self.cursor = cursor
            self.perPage = perPage
        }

        func asURLQueryItems() -> [URLQueryItem] {
            return CodingKeys.allCases.compactMap {
                switch $0 {
                    case .cursor: return transformIfNotNil(cursor, name: $0.rawValue)
                    case .perPage: return transformIfNotNil(perPage, name: $0.rawValue)
                }
            }
        }

        private enum CodingKeys: String, CodingKey, CaseIterable {
            case cursor
            case perPage = "per_page"
        }
    }
}

public extension FilesService.Model {

    struct SearchParameters: Codable, Equatable, Hashable, URLQueryItemConvertible {

        let query: String
        let perPage: Int

        public init(query: String, perPage: Int) {
            self.query = query
            self.perPage = perPage
        }

        func asURLQueryItems() -> [URLQueryItem] {
            return CodingKeys.allCases.compactMap {
                switch $0 {
                    case .query: return transformIfNotNil(query, name: $0.rawValue)
                    case .perPage: return transformIfNotNil(perPage, name: $0.rawValue)
                }
            }
        }

        private enum CodingKeys: String, CodingKey, CaseIterable {
            case query
            case perPage = "per_page"
        }
    }
}

public extension FilesService.Model {

    struct CreateFolderParameters: Codable, Equatable, Hashable, URLQueryItemConvertible {

        let name: String
        let parentId: Int

        public init(name: String, parentId: Int) {
            self.name = name
            self.parentId = parentId
        }

        func asURLQueryItems() -> [URLQueryItem] {
            return CodingKeys.allCases.compactMap {
                switch $0 {
                    case .name: return transformIfNotNil(name, name: $0.rawValue)
                    case .parentId: return transformIfNotNil(parentId, name: $0.rawValue)
                }
            }
        }

        private enum CodingKeys: String, CodingKey, CaseIterable {
            case name
            case parentId = "parent_id"
        }
    }
}

public extension FilesService.Model {

    struct RenameFileParameters: Codable, Equatable, Hashable, URLQueryItemConvertible {

        let id: Int
        let name: String

        public init(id: Int, name: String) {
            self.id = id
            self.name = name
        }

        func asURLQueryItems() -> [URLQueryItem] {
            return CodingKeys.allCases.compactMap {
                switch $0 {
                    case .id: return transformIfNotNil(id, name: $0.rawValue)
                    case .name: return transformIfNotNil(name, name: $0.rawValue)
                }
            }
        }

        private enum CodingKeys: String, CodingKey, CaseIterable {
            case id = "file_id"
            case name
        }
    }
}


public extension FilesService.Model {

    struct MoveFilesParameters: Codable, Equatable, Hashable {

        let fileIds: [Int]
        let parentId: Int

        private enum CodingKeys: String, CodingKey {
            case fileIds = "file_ids"
            case parentId = "parent_id"
        }
    }
}

public extension FilesService.Model {

    struct UploadFileParameters: Codable, Equatable, Hashable {

        let file: Data
        let filename: String
        let parentId: Int

        private enum CodingKeys: String, CodingKey {
            case file
            case filename
            case parentId = "parent_id"
        }
    }
}

public extension FilesService.Model {

    struct ConversionStatus: Codable, Equatable, Hashable {

        public enum Status: String, Codable {
            case new = "NEW"
            case inQueue = "IN_QUEUE"
            case extracting = "EXTRACTING"
            case extracted = "EXTRACTED"
            case password = "PASSWORD"
            case error = "ERROR"
        }

        let status: Status
        let percentDone: Int
        let size: Int

        private enum CodingKeys: String, CodingKey {
            case status
            case percentDone = "percent_done"
            case size
        }
    }
}

public extension FilesService.Model {

    struct Extraction: Codable, Hashable {

        public enum Status: String, Codable {
            case new = "NEW"
            case inQueue = "IN_QUEUE"
            case extracting = "EXTRACTING"
            case extracted = "EXTRACTED"
            case password = "PASSWORD"
            case error = "ERROR"
        }

        let id: Int
        let name: String
        let status: Status
        let message: String
        let parts: Int
        let fileIds: [Int]

        private enum CodingKeys: String, CodingKey {
            case id, name, status, message
            case parts = "num_parts"
            case fileIds = "files"
        }
    }
}

public extension FilesService.Model {

    struct Subtitle: Codable, Hashable {

        public enum Source: String, Codable {
            case opensubtitles, mkv, folder
        }

        public enum Format: String, Codable {
            case srt, webvtt
        }

        public let key: String
        public let language: String
        public let name: String
        public let source: Source
        public let url: URL?
        public let srtURL: URL?
        public let webvttURL: URL?

        private enum CodingKeys: String, CodingKey { case key, language, name, source, srtURL, webvttURL, url }
    }
}
