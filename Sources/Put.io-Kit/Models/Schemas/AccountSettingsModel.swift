//
//  AccountSettingsModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct AccountSettingsModel: Codable {

    let defaultDownloadFolder: Int
    let isInvisible: Bool
    let subtitleLanguages: [String]
    let defaultSubtitleLanguage: String?
}

private extension AccountSettingsModel {

    enum CodingKeys: String, CodingKey {

        case defaultDownloadFolder = "default_download_folder"
        case isInvisible = "is_invisible"
        case subtitleLanguages = "subtitle_languages"
        case defaultSubtitleLanguage = "default_subtitle_language"
    }
}
