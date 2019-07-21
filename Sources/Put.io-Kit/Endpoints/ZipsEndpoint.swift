//
//  ZipsEndpoint.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

enum ZipsEndpoint {

    case create(_ fileIds: [Int])
    case list
    case details(_ jobId: Int)

}

extension ZipsEndpoint: NetworkMeEndpointProtocol {

    var url: URL {

        switch self {
        case .create:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("zips")
                .appendingPathComponent("create")
        case .list:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("zips")
                .appendingPathComponent("list")
        case .details(let jobId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("zips")
                .appendingPathComponent(jobId.description)
        }
    }

    var method: NetworkMe.Method {

        switch self {
        case .create:
            return .post
        case .list:
            return .get
        case .details:
            return .get
        }
    }

    var body: Data? {

        switch self {
        case .create(let fileIds):
            return try? JSONEncoder().encode(fileIds)
        case .list:
            return nil
        case .details:
            return nil
        }
    }
}
