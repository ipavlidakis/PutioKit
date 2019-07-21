//
//  UploadFileParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct UploadFileParametersModel: Codable {

    let file: Data
    let filename: String
    let parentId: Int
}

private extension UploadFileParametersModel {

    enum CodingKeys: String, CodingKey {

        case file = "file"
        case filename = "filename"
        case parentId = "parent_id"
    }
}
