//
//  RSSFeedModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct RSSFeedModel: Codable {

    let id: Int
    let title: String
    let source: URL
    let parentFolder: Int
    let deletesOldFiles: Bool
    let keywords: [String]?
    let unwantedKeywords: [String]?
    let isPaused: Bool
    let isNotProcessingWholeFeed: Bool
}

private extension RSSFeedModel {

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case source = "rss_source_url"
        case parentFolder = "parent_dir_id"
        case deletesOldFiles = "delete_old_files"
        case keywords = "keyword"
        case isPaused = "paused"
        case isNotProcessingWholeFeed = "dont_process_whole_feed"
        case unwantedKeywords = "unwanted_keywords"
    }
}
