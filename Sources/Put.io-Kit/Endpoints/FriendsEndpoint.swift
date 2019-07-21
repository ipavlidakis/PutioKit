//
//  FriendsEndpoint.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

enum FriendsEndpoint {

    case list
    case waitingRequests
    case sendFriendRequest(_ username: String)
    case approveFriendRequest(_ username: String)
    case denyFriendRequest(_ username: String)
    case unfriend(_ username: String)
}

extension FriendsEndpoint: NetworkMeEndpointProtocol {

    var url: URL {

        switch self {
        case .list:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("friends")
                .appendingPathComponent("list")
        case .waitingRequests:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("friends")
                .appendingPathComponent("waiting-requests")
        case .sendFriendRequest(let username):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("friends")
                .appendingPathComponent(username)
                .appendingPathComponent("request")
        case .approveFriendRequest(let username):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("friends")
                .appendingPathComponent(username)
                .appendingPathComponent("approve")
        case .denyFriendRequest(let username):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("friends")
                .appendingPathComponent(username)
                .appendingPathComponent("deny")
        case .unfriend(let username):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("friends")
                .appendingPathComponent(username)
                .appendingPathComponent("unfriend")
        }
    }

    var method: NetworkMe.Method {

        switch self {
        case .list:
            return .get
        case .waitingRequests:
            return .get
        case .sendFriendRequest:
            return .post
        case .approveFriendRequest:
            return .post
        case .denyFriendRequest:
            return .post
        case .unfriend:
            return .post
        }
    }
}
