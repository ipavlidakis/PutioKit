//
//  FilesEndpoint.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 19/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import NetworkMe

enum FilesEndpoint {

    case list(_ parameters: FileListParametersModel)
    case continueList(_ parameters: FileListContinueParametersModel)
    case search(_ parameters: FileSearchParametersModels)
    case continueSearch(_ parameters: FileSearchContinueParametersModel)
    case createFolder(_ parameters: CreateFolderParametersModel)
    case renameFile(_ parameters: RenameFileParametersModel)
    case moveFiles(_ parameters: MoveFilesParametersModel)
    case convertFile(_ fileId: Int)
    case fileConversionStatus(_ fileId: Int)
    case listAvailableSubtitles(_ fileId: Int)
    case downloadSubtitle(_ parameters: DownloadSubtitleFileParametersModel)
    case downloadHLSPlaylist(_ parameters: DownloadHLSPlaylistParametersModel)
    case deleteFiles(_ fileIds: [Int])
    case uploadFile(_ parameters: UploadFileParametersModel)
    case fetchDownloadFileURL(_ fileId: Int)
    case listArchiveExtractions
    case setVideoPosition(_ parameters: SetVideoPositionParametersModel)
    case deleteVideoPosition(_ fileId: Int)
}

extension FilesEndpoint: NetworkMeEndpointProtocol {

    var taskType: NetworkMe.TaskType {

        switch self {
        case .downloadSubtitle:
            return .download
        case .downloadHLSPlaylist:
            return .download
        case .uploadFile:
            return .upload
        default:
            return .data
        }
    }

    var url: URL {

        switch self {
        case .list:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("list")
        case .continueList:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("list")
                .appendingPathComponent("continue")
        case .search:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("search")
        case .continueSearch:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("search")
                .appendingPathComponent("continue")
        case .createFolder:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("create-folder")
        case .renameFile:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("rename")
        case .moveFiles:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("move")
        case .convertFile(let fileId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent(fileId.description)
                .appendingPathComponent("mp4")
        case .fileConversionStatus(let fileId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent(fileId.description)
                .appendingPathComponent("mp4")
        case .listAvailableSubtitles(let fileId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent(fileId.description)
                .appendingPathComponent("subtitles")
        case .downloadSubtitle(let parameters):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent(parameters.fileId.description)
                .appendingPathComponent("subtitles")
                .appendingPathComponent(parameters.key)
        case .downloadHLSPlaylist(let parameters):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent(parameters.fileId.description)
                .appendingPathComponent("hls")
                .appendingPathComponent(parameters.key)
        case .deleteFiles:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("delete")
        case .uploadFile:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("upload")
        case .fetchDownloadFileURL(let fileId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent(fileId.description)
                .appendingPathComponent("url")
        case .listArchiveExtractions:
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent("extract")
        case .setVideoPosition(let parameters):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent(parameters.fileId.description)
                .appendingPathComponent("start-from")
        case .deleteVideoPosition(let fileId):
            return PutioKit.Constants.baseURL
                .appendingPathComponent("files")
                .appendingPathComponent(fileId.description)
                .appendingPathComponent("start-from")
                .appendingPathComponent("delete")
        }
    }

    var method: NetworkMe.Method {

        switch self {
        case .list:
            return .get
        case .continueList:
            return .post
        case .search:
            return .get
        case .continueSearch:
            return .post
        case .createFolder:
            return .post
        case .renameFile:
            return .post
        case .moveFiles:
            return .post
        case .convertFile:
            return .post
        case .fileConversionStatus:
            return .get
        case .listAvailableSubtitles:
            return .get
        case .downloadSubtitle:
            return .get
        case .downloadHLSPlaylist:
            return .get
        case .deleteFiles:
            return .post
        case .uploadFile:
            return .post
        case .fetchDownloadFileURL:
            return .get
        case .listArchiveExtractions:
            return .get
        case .setVideoPosition:
            return .post
        case .deleteVideoPosition:
            return .post
        }
    }

    var queryItems: [URLQueryItem]? {

        switch self {
        case .list(let parameters):
            return try? NetworkMe.URLQueryItemEncoder().encode(parameters)
        case .continueList:
            return nil
        case .search(let parameters):
            return try? NetworkMe.URLQueryItemEncoder().encode(parameters)
        case .continueSearch:
            return nil
        case .createFolder:
            return nil
        case .renameFile:
            return nil
        case .moveFiles:
            return nil
        case .convertFile:
            return nil
        case .fileConversionStatus:
            return nil
        case .listAvailableSubtitles:
            return nil
        case .downloadSubtitle(let parameters):
            return try? NetworkMe.URLQueryItemEncoder()
                .encode(["format": parameters.format])
        case .downloadHLSPlaylist:
            return nil
        case .deleteFiles:
            return nil
        case .uploadFile:
            return nil
        case .fetchDownloadFileURL:
            return nil
        case .listArchiveExtractions:
            return nil
        case .setVideoPosition:
            return nil
        case .deleteVideoPosition:
            return nil
        }
    }

    var body: Data? {

        switch self {
        case .list:
            return nil
        case .continueList(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .search:
            return nil
        case .continueSearch(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .createFolder(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .renameFile(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .moveFiles(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .convertFile:
            return nil
        case .fileConversionStatus:
            return nil
        case .listAvailableSubtitles:
            return nil
        case .downloadSubtitle:
            return nil
        case .downloadHLSPlaylist:
            return nil
        case .deleteFiles(let fileIds):
            return try? JSONEncoder().encode(["file_ids": fileIds])
        case .uploadFile(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .fetchDownloadFileURL:
            return nil
        case .listArchiveExtractions:
            return nil
        case .setVideoPosition(let parameters):
            return try? JSONEncoder().encode(["time": parameters.timeInSeconds])
        case .deleteVideoPosition:
            return nil
        }
    }

    var requestHeaders: [NetworkMeHeaderProtocol] {

        return [NetworkMe.Header.Request.contentType(.json)]
    }
}
