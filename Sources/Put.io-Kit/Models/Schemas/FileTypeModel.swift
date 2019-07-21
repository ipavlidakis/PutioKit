//
//  FileTypeModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

enum FileTypeModel: String, Codable {

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
