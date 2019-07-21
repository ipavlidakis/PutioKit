//
//  TransfersEndpoint.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 22/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

enum TransfersEndpoint {

    case list
    case details(_ transferId: Int)
    case add(_ parameters: AddTransferParametersModel)
    case retry(_ transferId: Int)
    case cancel(_ transferIds: [Int])
    case clean(_ transferIds: [Int])
    case remove(_ transferIds: [Int])
}

extension TransfersEndpoint: NetworkMeEndpointProtocol {

    var url: URL {

        switch self {
        case .list:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("transfers")
                .appendingPathComponent("list")
        case .details(let transferId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("transfers")
                .appendingPathComponent(transferId.description)
        case .add:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("transfers")
                .appendingPathComponent("add")
        case .retry:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("transfers")
                .appendingPathComponent("retry")
        case .cancel:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("transfers")
                .appendingPathComponent("cancel")
        case .clean:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("transfers")
                .appendingPathComponent("clean")
        case .remove:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("transfers")
                .appendingPathComponent("remove")
        }
    }

    var method: NetworkMe.Method {

        switch self {
        case .list:
            return .get
        case .details:
            return .get
        case .add:
            return .post
        case .retry:
            return .post
        case .cancel:
            return .post
        case .clean:
            return .post
        case .remove:
            return .post
        }
    }

    var queryItems: [URLQueryItem]? {

        switch self {
        case .list:
            return nil
        case .details:
            return nil
        case .add:
            return nil
        case .retry(let transferId):
            return [URLQueryItem(name: "id", value: transferId.description)]
        case .cancel:
            return nil
        case .clean:
            return nil
        case .remove:
            return nil
        }
    }

    var body: Data? {

        switch self {
        case .list:
            return nil
        case .details:
            return nil
        case .add(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .retry:
            return nil
        case .cancel(let transferIds):
            return try? JSONEncoder().encode(transferIds)
        case .clean(let transferIds):
            return try? JSONEncoder().encode(transferIds)
        case .remove(let transferIds):
            return try? JSONEncoder().encode(transferIds)
        }
    }
}
