//
//  PutIOKitError.swift
//  PutioKit
//  
//
//  Created by Ilias Pavlidakis on 04/03/2020.
//

import Foundation

public enum PutIOKitError: Error {

    case offline
    case unauthorised
    case requestFailed(statusCode: Int)
    case uploadTaskFailed
    case invalidParameters
    case invalidURL
    case parsingFailed
    case invalidResponse(String)
    case failedToDownloadContentOfFile

    static func isOffline(error: Error) -> Bool {
        (error as NSError).code == -1009
    }
}

public extension PutIOKitError {

    enum Authentication: Error {
        case invalidUsername(_ username: String)
        case invalidPassword(_ password: String)
        case authenticateFailed(_ error: Error)
    }

    enum Files: Error {
        case invalidMultipartData
    }

    enum Share: Error {
        public static func hasExceededLimit(_ error: Error) -> Bool {
            guard let errorModel = error as? ErrorModel, errorModel.message == "PUBLIC_SHARE_EXCEEDED_LIMIT" else { return false }
            return true
        }
    }
}
