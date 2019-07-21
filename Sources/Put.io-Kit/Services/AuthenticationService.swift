//
//  AuthenticationService.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

public struct AuthenticationService {

    let router: NetworkMeRouting
    let clientModel: ApiClientModel

    public init(router: NetworkMeRouting,
                clientModel: ApiClientModel) {

        self.router = router
        self.clientModel = clientModel
    }
}

public extension AuthenticationService {

    func authenticate(
        username: String,
        password: String,
        completion: @escaping (String?, Error?) -> Void) {

        let endpoint = AuthenticationEndpoint.authenticate(
            username: username,
            password: password,
            clientModel: clientModel)

        router.request(endpoint: endpoint) { (result: Result<AccessTokenModel, NetworkMe.Router.NetworkError>, response) in

            switch result {
            case .success(let accessToken):
                completion(accessToken.token, nil)
            case .failure(let error):
                completion(nil, error)
            }

            return
        }
    }
}
