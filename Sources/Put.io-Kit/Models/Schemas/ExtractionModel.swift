//
//  ExtractionModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct ExtractionModel: Codable {

    enum Status: String, Codable {

        case inQueue = "IN_QUEUE"
        case extracting = "EXTRACTING"
        case extracted = "EXTRACTED"
        case password = "PASSWORD"
        case error = "ERROR"
    }

    let id: Int
    let name: String
    let status: ExtractionModel.Status
    let message: String
    let numberOfParts: Int
    let fileIds: [Int]
}

private extension ExtractionModel {

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case status = "status"
        case message = "message"
        case numberOfParts = "num_parts"
        case fileIds = "files"
    }
}
