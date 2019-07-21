//
//  SharesEndpoint.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

enum SharesEndpoint {

    case shareFilesWithFriends(_ parameters: ShareFilesWithFriendsParametersModel)
    case shareFilesWithAllFriends(_ parameters: ShareFilesWithAllFriendsParametersModel)
    case list
    case fileSharedWith(_ fileId: Int)
    case unshareFilesWithFriends(_ friendIds: [Int])
    case unshareFilesWithAllFriends
}

extension SharesEndpoint: NetworkMeEndpointProtocol {

    var url: URL {

        switch self {
        case .shareFilesWithFriends:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("share")
        case .shareFilesWithAllFriends:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("share")
        case .list:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("shared")
        case .fileSharedWith(let fileId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent(fileId.description)
                .appendingPathComponent("shared-with")
        case .unshareFilesWithFriends:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("unshare")
        case .unshareFilesWithAllFriends:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("unshare")
        }
    }

    var method: NetworkMe.Method {

        switch self {
        case .shareFilesWithFriends:
            return .post
        case .shareFilesWithAllFriends:
            return .post
        case .list:
            return .get
        case .fileSharedWith:
            return .get
        case .unshareFilesWithFriends:
            return .post
        case .unshareFilesWithAllFriends:
            return .post
        }
    }

    var body: Data? {

        switch self {
        case .shareFilesWithFriends(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .shareFilesWithAllFriends(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .list:
            return nil
        case .fileSharedWith:
            return nil
        case .unshareFilesWithFriends(let friendIds):
            return try? JSONEncoder().encode(["shares": friendIds])
        case .unshareFilesWithAllFriends:
            return try? JSONEncoder().encode(["shares": "everyone"])
        }
    }
}
