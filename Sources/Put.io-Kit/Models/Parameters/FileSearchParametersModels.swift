//
//  FileSearchParametersModels.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct FileSearchParametersModels: Codable {

    let query: String
    let perPage: Int
}

private extension FileSearchParametersModels {

    enum CodingKeys: String, CodingKey {

        case query = "query"
        case perPage = "per_page"
    }
}
