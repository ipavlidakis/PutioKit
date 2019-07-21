//
//  DownloadSubtitleFileParametersModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct DownloadSubtitleFileParametersModel: Codable {

    enum Format: String, Codable { case srt, webvtt }

    let fileId: Int
    let key: String
    let format: DownloadSubtitleFileParametersModel.Format
}

private extension DownloadSubtitleFileParametersModel {

    enum CodingKeys: String, CodingKey {

        case fileId = "id"
        case key = "key"
        case format = "format"
    }
}
