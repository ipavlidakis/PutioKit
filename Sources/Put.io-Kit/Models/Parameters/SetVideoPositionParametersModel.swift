//
//  SetVideoPositionParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct SetVideoPositionParametersModel: Codable {

    let fileId: Int
    let timeInSeconds: Int
}

private extension SetVideoPositionParametersModel {

    enum CodingKeys: String, CodingKey {

        case fileId = "id"
        case timeInSeconds = "time"
    }
}
