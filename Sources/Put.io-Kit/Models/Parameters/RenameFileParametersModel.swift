//
//  RenameFileParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct RenameFileParametersModel: Codable {

    let fileId: Int
    let name: String
}

private extension RenameFileParametersModel {

    enum CodingKeys: String, CodingKey {

        case fileId = "file_id"
        case name = "name"
    }
}
