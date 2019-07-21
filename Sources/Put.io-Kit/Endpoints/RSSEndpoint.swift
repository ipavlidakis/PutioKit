//
//  RSSEndpoint.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

enum RSSEndpoint {

    case list
    case feedDetails(_ feedId: Int)
    case create(_ feed: RSSFeedModel)
    case update(_ feed: RSSFeedModel)
    case pause(_ feedId: Int)
    case resume(_ feedId: Int)
    case delete(_ feedId: Int)
}

extension RSSEndpoint: NetworkMeEndpointProtocol {

    var url: URL {

        switch self {
        case .list:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("rss")
                .appendingPathComponent("list")
        case .feedDetails(let feedId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("rss")
                .appendingPathComponent(feedId.description)
        case .create:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("rss")
                .appendingPathComponent("create")
        case .update(let feed):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("rss")
                .appendingPathComponent(feed.id.description)
        case .pause(let feedId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("rss")
                .appendingPathComponent(feedId.description)
                .appendingPathComponent("pause")
        case .resume(let feedId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("rss")
                .appendingPathComponent(feedId.description)
                .appendingPathComponent("resume")
        case .delete(let feedId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("rss")
                .appendingPathComponent(feedId.description)
                .appendingPathComponent("delete")
        }
    }

    var method: NetworkMe.Method {

        switch self {
        case .list:
            return .get
        case .feedDetails:
            return .get
        case .create:
            return .post
        case .update:
            return .post
        case .pause:
            return .post
        case .resume:
            return .post
        case .delete:
            return .post
        }
    }

    var body: Data? {

        switch self {
        case .list:
            return nil
        case .feedDetails:
            return nil
        case .create(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .update(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .pause:
            return nil
        case .resume:
            return nil
        case .delete:
            return nil
        }
    }
}
