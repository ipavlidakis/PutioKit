//
//  AuthenticationEndpoint.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

enum AuthenticationEndpoint {

    case authenticate(username: String, password: String, clientModel: ApiClientModel)
}

extension AuthenticationEndpoint: NetworkMeEndpointProtocol {

    var url: URL {

        switch self {
        case .authenticate(_, _, let clientModel):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("oauth2")
                .appendingPathComponent("authorizations")
                .appendingPathComponent("clients")
                .appendingPathComponent(clientModel.id)
        }
    }

    var queryItems: [URLQueryItem]? {

        switch self {
        case .authenticate(_, _, let clientModel):
            return [
                "client_secret": clientModel.secret,
                "client_name": clientModel.name
            ].map { URLQueryItem(name: $0.key, value: $0.value) }
        }
    }

    var method: NetworkMe.Method {

        switch self {
        case .authenticate:
            return .put
        }
    }

    var requestHeaders: [NetworkMeHeaderProtocol] {

        switch self {
        case .authenticate(let username, let password, _):
            return [
                NetworkMe.Header.Request.contentType(.formUnencoded),
                NetworkMe.Header.Request.authorization(.basic(username: username, password: password))
            ]
        }
    }
}
