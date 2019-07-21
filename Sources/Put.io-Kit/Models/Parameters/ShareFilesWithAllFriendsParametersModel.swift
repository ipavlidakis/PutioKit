//
//  ShareFilesWithAllFriendsParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct ShareFilesWithAllFriendsParametersModel: Codable {

    let fileIds: [Int]
    let usernames = "everyone"
}

private extension ShareFilesWithAllFriendsParametersModel {

    enum CodingKeys: String, CodingKey {

        case fileIds = "file_ids"
        case usernames = "friends"
    }
}
