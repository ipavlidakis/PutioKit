//
//  FileModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct FileModel: Codable {

    let createdAt: Date
    let id: Int
    let isMP4Available: Bool
    let isShared: Bool
    let name: String
    let parentFolder: Int
    let screenshot: URL?
    let type: FileTypeModel
    let fileExtension: String
    let requiresConversion: Bool
    let size: Int
    let mp4Size: Int
}

private extension FileModel {

    enum CodingKeys: String, CodingKey {

        case createdAt = "created_at"
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
    }
}
