//
//  AuthorizedEndpoint.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

@dynamicMemberLookup
struct AuthorizedEndpoint: NetworkMeEndpointProtocol {

    private let endpoint: NetworkMeEndpointProtocol
    private let accessToken: String

    var url: URL { return endpoint.url }

    init(endpoint: NetworkMeEndpointProtocol,
         accessToken: String) {
        self.endpoint = endpoint
        self.accessToken = accessToken
    }

    subscript<T>(dynamicMember keyPath: KeyPath<NetworkMeEndpointProtocol, T>) -> T {

        guard
            keyPath == \NetworkMeEndpointProtocol.requestHeaders,
            let requestHeaders = endpoint[keyPath: keyPath] as? [NetworkMeHeaderProtocol]
            else {
                return endpoint[keyPath: keyPath]
        }

        return requestHeaders
            + [NetworkMe.Header.Request.authorization(.bearer(token: accessToken))] as! T
    }
}
