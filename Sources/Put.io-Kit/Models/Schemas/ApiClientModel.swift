//
//  ApiClientModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

public struct ApiClientModel {

    let id: String
    let secret: String
    let name: String

    public init(
        id: String,
        secret: String,
        name: String) {

        self.id = id
        self.secret = secret
        self.name = name
    }
}
