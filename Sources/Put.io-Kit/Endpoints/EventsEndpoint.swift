//
//  EventsEndpoint.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

enum EventsEndpoint {

    case list
    case delete
}

extension EventsEndpoint: NetworkMeEndpointProtocol {

    var url: URL {

        switch self {
        case .list:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("events")
                .appendingPathComponent("list")
        case .delete:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("events")
                .appendingPathComponent("delete")
        }
    }

    var method: NetworkMe.Method {

        switch self {
        case .list:
            return .get
        case .delete:
            return .post
        }
    }
}
