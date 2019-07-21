//
//  ExtractArchiveParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct ExtractArchiveParametersModel: Codable {

    let fileIds: [Int]
    let password: String
}

private extension ExtractArchiveParametersModel {

    enum CodingKeys: String, CodingKey {

        case fileIds = "file_ids"
        case password = "password"
    }
}
