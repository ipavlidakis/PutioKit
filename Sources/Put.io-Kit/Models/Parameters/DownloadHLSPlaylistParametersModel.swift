//
//  DownloadHLSPlaylistParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct DownloadHLSPlaylistParametersModel: Codable {

    enum Format: String, Codable { case srt, webvtt }

    let fileId: Int
    let key: String
}

private extension DownloadHLSPlaylistParametersModel {

    enum CodingKeys: String, CodingKey {

        case fileId = "id"
        case key = "key"
    }
}
