//
//  TransferModel.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

import Foundation

struct TransferModel: Codable {

    enum Status: String, Codable {

        case inQueue = "IN_QUEUE"
        case waiting = "WAITING"
        case downloading = "DOWNLOADING"
        case completing = "COMPLETING"
        case seeding = "SEEDING"
        case completed = "COMPLETED"
        case error = "ERROR"
    }

    enum Kind: String, Codable {

        case torrent = "TORRENT"
        case url = "URL"
        case playlist = "PLAYLIST"
    }

    let availability: Int
    let createdAt: Date
    let ratio: Float
    let isDownloaded: Bool
    let isUploaded: Bool
    let downSpeed: Int
    let upSpeed: Int
    let errorMessage: String?
    let estimatedTime: Int
    let fileId: Int
    let finishedAt: Date
    let id: Int
    let isPrivate: Bool
    let name: String
    let perrs: Int
    let percentDone: Int
    let parentFolder: Int
    let secondsSeeding: Int
    let size: Int
    let source: String
    let status: TransferModel.Status
    let subscriptionId: Int
    let trackerMessage: String
    let kind: TransferModel.Kind
}

private extension TransferModel {

    enum CodingKeys: String, CodingKey {

        case availability = "availability"
        case createdAt = "created_at"
        case ratio = "current_ratio"
        case isDownloaded = "downloaded"
        case isUploaded = "uploaded"
        case downSpeed = "down_speed"
        case upSpeed = "up_speed"
        case errorMessage = "error_message"
        case estimatedTime = "estimated_time"
        case fileId = "file_id"
        case finishedAt = "finished_at"
        case id = "id"
        case isPrivate = "is_private"
        case name = "name"
        case perrs = "peers"
        case percentDone = "percent_done"
        case parentFolder = "save_parent_id"
        case secondsSeeding = "seconds_seeding"
        case size = "size"
        case source = "source"
        case status = "status"
        case subscriptionId = "subscription_id"
        case trackerMessage = "tracker_message"
        case kind = "type"
    }
}
