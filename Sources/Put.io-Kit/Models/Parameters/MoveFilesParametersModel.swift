//
//  MoveFilesParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct MoveFilesParametersModel: Codable {

    let fileIds: [Int]
    let parentId: Int
}

private extension MoveFilesParametersModel {

    enum CodingKeys: String, CodingKey {

        case fileIds = "file_ids"
        case parentId = "parent_id"
    }
}
