//
//  AccountInfoModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct AccountInfoModel: Codable {

    let id: Int
    let username: String
    let mail: String
}

private extension AccountInfoModel {

    enum CodingKeys: String, CodingKey {

        case id = "user_id"
        case username = "username"
        case mail = "mail"
    }
}
