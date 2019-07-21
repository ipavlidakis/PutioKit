//
//  CreateFolderParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct CreateFolderParametersModel: Codable {

    let name: String
    let parentId: Int
}

private extension CreateFolderParametersModel {

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case parentId = "parent_id"
    }
}

