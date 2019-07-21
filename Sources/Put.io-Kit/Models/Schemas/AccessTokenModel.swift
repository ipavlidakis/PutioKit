//
//  AccessTokenModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct AccessTokenModel: Codable {

    let token: String
}

private extension AccessTokenModel {

    enum CodingKeys: String, CodingKey {

        case token = "access_token"
    }
}
