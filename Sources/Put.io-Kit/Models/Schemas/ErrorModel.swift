//
//  ErrorModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct ErrorModel: Codable {

    let id: String
    let type: String
    let message: String
}

private extension ErrorModel {

    enum CodingKeys: String, CodingKey {

        case id = "error_id"
        case type = "error_type"
        case message = "error_message"
    }
}
