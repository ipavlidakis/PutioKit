//
//  FileListContinueParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct FileListContinueParametersModel: Codable {

    let cursor: String
    let perPage: Int
}

private extension FileListContinueParametersModel {

    enum CodingKeys: String, CodingKey {

        case cursor = "cursor"
        case perPage = "per_page"
    }
}
