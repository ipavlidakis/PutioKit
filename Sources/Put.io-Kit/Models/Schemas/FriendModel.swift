//
//  FriendModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct FriendModel: Codable {

    let id: Int
    let name: String
    let avatar: URL
}

private extension FriendModel {

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case avatar = "avatar_url"
        case id = "id"
    }
}
