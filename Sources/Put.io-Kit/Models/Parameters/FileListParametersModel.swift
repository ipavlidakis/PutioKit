//
//  FileListParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

public struct FileListParametersModel: Codable {

    let parentId: Int?
    let perPage: Int?
    let sortBy: FileListParametersModel.SortBy?
    let contentType: String?
    let fileType: [FileListParametersModel.FileTypes]?
    let includeStreamURLInFiles: Bool
    let includeStreamURLInParent: Bool
    let includeMP4StreamURLInFiles: Bool
    let includeMP4StreamURLInParent: Bool
    let showHiddenFolders: Bool
    let includeMP4Status: Bool

    init(parentId: Int?,
         perPage: Int?,
         sortBy: FileListParametersModel.SortBy?,
         contentType: String?,
         fileType: [FileTypes]?,
         includeStreamURLInFiles: Bool = false,
         includeStreamURLInParent: Bool = false,
         includeMP4StreamURLInFiles: Bool = false,
         includeMP4StreamURLInParent: Bool = false,
         showHiddenFolders: Bool = false,
         includeMP4Status: Bool = false) {

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
}

private extension FileListParametersModel {

    enum CodingKeys: String, CodingKey {

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

public extension FileListParametersModel {

    enum SortBy: String, Codable {
        case nameAscending = "NAME_ASC"
        case nameDescending = "NAME_DESC"
        case sizeAscending = "SIZE_ASC"
        case sizeDescending = "SIZE_DESC"
        case dateAscending = "DATE_ASC"
        case dateDescending = "DATE_DESC"
        case modifiedAscending = "MODIFIED_ASC"
        case modifiedDescending = "MODIFIED_DESC"
    }

    enum FileTypes: String, Codable {
        case folder = "FOLDER"
        case file = "FILE"
        case audio = "AUDIO"
        case video = "VIDEO"
        case image = "IMAGE"
        case archive = "ARCHIVE"
        case pdf = "PDF"
        case text = "TEXT"
        case swf = "SWF"
    }
}
