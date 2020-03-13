//
//  ErrorModel.swift
//  Put.io-Kit Reference App
//
//  Created by Ilias Pavlidakis on 05/03/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

public struct ErrorModel: Codable, Hashable, Error {

    let type: String?
    let message: String
    let id: String?
    let uri: String?
    let status: String?
    let code: Int?

    init(type: String? = nil,
         message: String,
         id: String? = nil,
         uri: String? = nil,
         status: String? = nil,
         code: Int? = nil) {
        self.type = type
        self.message = message
        self.id = id
        self.uri = uri
        self.status = status
        self.code = code
    }

    private enum CodingKeys: String, CodingKey {
        case type = "error_type"
        case message = "error_message"
        case id = "error_id"
        case uri = "error_uri"
        case status
        case code = "status_code"
    }
}
