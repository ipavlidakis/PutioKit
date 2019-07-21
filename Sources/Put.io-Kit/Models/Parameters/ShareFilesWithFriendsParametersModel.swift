//
//  ShareFilesWithFriendsParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct ShareFilesWithFriendsParametersModel: Codable {

    let fileIds: [Int]
    let usernames: [String]
}

private extension ShareFilesWithFriendsParametersModel {

    enum CodingKeys: String, CodingKey {

        case fileIds = "file_ids"
        case usernames = "friends"
    }
}
