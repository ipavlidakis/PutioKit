//
//  AccountEndpoint.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

enum AccountEndpoint {

    case info
    case fetchSettings
    case updateSettings(_ settings: AccountSettingsModel)
}

extension AccountEndpoint: NetworkMeEndpointProtocol {

    var url: URL {

        switch self {

        case .info:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("account")
                .appendingPathComponent("info")
        case .fetchSettings:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("account")
                .appendingPathComponent("settings")
        case .updateSettings:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("account")
                .appendingPathComponent("settings")
        }
    }

    var method: NetworkMe.Method {

        switch self {
        case .info:
            return .get
        case .fetchSettings:
            return .get
        case .updateSettings:
            return .post
        }
    }

    var body: Data? {

        switch self {
        case .updateSettings(let settings):
            return try? JSONEncoder().encode(settings)
        default:
            return nil
        }
    }
}
