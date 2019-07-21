//
//  ConfigEndpoint.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

enum ConfigEndpoint {

    case read
    case write(jsonData: Data)
    case readKeyPath(_ keyPath: String)
    case writeKeyPath(_ keyPath: String)
    case deleteKeyPath(_ keyPath: String)
}

extension ConfigEndpoint: NetworkMeEndpointProtocol {

    var url: URL {

        switch self {
        case .read:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("config")
        case .write:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("config")
        case .readKeyPath(let keypath):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("config")
                .appendingPathExtension(keypath)
        case .writeKeyPath(let keypath):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("config")
                .appendingPathExtension(keypath)
        case .deleteKeyPath(let keypath):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("config")
                .appendingPathExtension(keypath)
        }
    }

    var method: NetworkMe.Method {

        switch self {
        case .read:
            return .get
        case .write:
            return .put
        case .readKeyPath:
            return .get
        case .writeKeyPath:
            return .put
        case .deleteKeyPath:
            return .delete
        }
    }

    var body: Data? {

        switch self {
        case .read:
            return nil
        case .write(let jsonData):
            return jsonData
        case .readKeyPath:
            return nil
        case .writeKeyPath:
            return nil
        case .deleteKeyPath:
            return nil
        }
    }
}
