//
//  AddTransferParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 22/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct AddTransferParametersModel: Codable {

    let url: String
    let parentId: Int?
    let callbackURL: URL?
}

private extension AddTransferParametersModel {

    enum CodingKeys: String, CodingKey {

        case url = "url"
        case parentId = "save_parent_id"
        case callbackURL = "callbackURL"
    }
}
