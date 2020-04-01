//
//  FilesService+VideoOperations.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 07/03/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation
import Combine

public extension FilesService {

    struct VideoOperations {

        private let clientModel: ApiClientModel
        private let networkHandler: NetworkHandling
        private let credentialsStore: CredentialsStoring

        public init(clientModel: ApiClientModel,
                    networkHandler: NetworkHandling,
                    credentialsStore: CredentialsStoring) {

            self.clientModel = clientModel
            self.networkHandler = networkHandler
            self.credentialsStore = credentialsStore
        }
    }
}

public extension FilesService.VideoOperations {

    func availableSubtitles(
        for videoFile: FilesService.Model.File,
        completion: @escaping FilesService.SubtitlesCompletion
    ) -> AnyCancellable? {

        guard videoFile.type == .video else {
            completion(.failure(PutIOKitError.invalidParameters))
            return nil
        }

        let url = Constants.baseURL
            .appendingPathComponent("files")
            .appendingPathComponent("\(videoFile.id)")
            .appendingPathComponent("subtitles")

        guard let authenticationHeader = FilesService.authenticationHeader(credentialsStore: credentialsStore) else {
            completion(.failure(PutIOKitError.unauthorised))
            return nil
        }

        let headers: [URLRequest.HeaderPair] = [
            authenticationHeader,
            .contentTypeJSON
        ]

        guard let request = URLRequest(method: .get, url: url, headers: headers) else {
            completion(.failure(PutIOKitError.invalidURL))
            return nil
        }

        return networkHandler.startDataTask(
            with: request,
            completion: Helpers.dictionaryKeyValueCompletion(key: "subtitles", completion: completion))
    }

    func download(
        subtitle: FilesService.Model.Subtitle,
        for videoFile: FilesService.Model.File,
        format: FilesService.Model.Subtitle.Format,
        completion: @escaping StringContentCompletion
    ) -> AnyCancellable? {

        guard videoFile.type == .video else {
            completion(.failure(PutIOKitError.invalidParameters))
            return nil
        }

        let url = Constants.baseURL
            .appendingPathComponent("files")
            .appendingPathComponent("\(videoFile.id)")
            .appendingPathComponent("subtitles")
            .appendingPathComponent("\(subtitle.key)")

        guard let authenticationHeader = FilesService.authenticationHeader(credentialsStore: credentialsStore) else {
            completion(.failure(PutIOKitError.unauthorised))
            return nil
        }

        let headers: [URLRequest.HeaderPair] = [
            authenticationHeader,
            .contentTypeJSON,
        ]

        guard let request = URLRequest(method: .get, url: url, queryItems: [URLQueryItem(name: "format", value: format.rawValue)], headers: headers) else {
            completion(.failure(PutIOKitError.invalidURL))
            return nil
        }

        return networkHandler.startDataTask(with: request, completion: completion)
    }

    func downloadHLSPlaylist(
        subtitle: FilesService.Model.Subtitle?,
        for videoFile: FilesService.Model.File,
        completion: @escaping StringContentCompletion
    ) -> AnyCancellable? {

        guard videoFile.type == .video else {
            completion(.failure(PutIOKitError.invalidParameters))
            return nil
        }

        let url = Constants.baseURL
            .appendingPathComponent("files")
            .appendingPathComponent("\(videoFile.id)")
            .appendingPathComponent("hls")
            .appendingPathComponent("media.m3u8")

        guard let authenticationHeader = FilesService.authenticationHeader(credentialsStore: credentialsStore) else {
            completion(.failure(PutIOKitError.unauthorised))
            return nil
        }

        let headers: [URLRequest.HeaderPair] = [
            authenticationHeader,
            .contentTypeJSON,
        ]

        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "subtitle_key", value: subtitle?.key ?? "all")
        ]

        guard let request = URLRequest(method: .get, url: url, queryItems: queryItems, headers: headers) else {
            completion(.failure(PutIOKitError.invalidURL))
            return nil
        }

        return networkHandler.startDataTask(with: request, completion: completion)
    }

    func setPosition(
        for videoFile: FilesService.Model.File,
        position: Int,
        completion: @escaping SuccessCompletion
    ) -> AnyCancellable? {

        guard videoFile.type == .video else {
            completion(.failure(PutIOKitError.invalidParameters))
            return nil
        }

        let url = Constants.baseURL
            .appendingPathComponent("files")
            .appendingPathComponent("\(videoFile.id)")
            .appendingPathComponent("start-from")

        guard let authenticationHeader = FilesService.authenticationHeader(credentialsStore: credentialsStore) else {
            completion(.failure(PutIOKitError.unauthorised))
            return nil
        }

        guard let body = try? JSONEncoder().encode(["time": position]) else {
            completion(.failure(PutIOKitError.invalidParameters))
            return nil
        }

        let headers: [URLRequest.HeaderPair] = [
            authenticationHeader,
            .contentTypeJSON
        ]

        guard let request = URLRequest(method: .post, url: url, body: body, headers: headers) else {
            completion(.failure(PutIOKitError.invalidURL))
            return nil
        }

        return networkHandler.startDataTask(with: request, completion: completion)
    }

    func deletePosition(
        for videoFile: FilesService.Model.File,
        completion: @escaping SuccessCompletion
    ) -> AnyCancellable? {

        guard videoFile.type == .video else {
            completion(.failure(PutIOKitError.invalidParameters))
            return nil
        }

        let url = Constants.baseURL
            .appendingPathComponent("files")
            .appendingPathComponent("\(videoFile.id)")
            .appendingPathComponent("start-from")
            .appendingPathComponent("delete")

        guard let authenticationHeader = FilesService.authenticationHeader(credentialsStore: credentialsStore) else {
            completion(.failure(PutIOKitError.unauthorised))
            return nil
        }

        let headers: [URLRequest.HeaderPair] = [
            authenticationHeader,
        ]

        guard let request = URLRequest(method: .post, url: url, headers: headers) else {
            completion(.failure(PutIOKitError.invalidURL))
            return nil
        }

        return networkHandler.startDataTask(with: request, completion: completion)
    }
}
