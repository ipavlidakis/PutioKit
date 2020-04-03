//
//  PutIOKitError.swift
//  PutioKit
//  
//
//  Created by Ilias Pavlidakis on 04/03/2020.
//

import Foundation

public enum PutIOKitError: Error {

    case unauthorised
    case requestFailed(statusCode: Int)
    case uploadTaskFailed
    case invalidParameters
    case invalidURL
    case parsingFailed
    case invalidResponse(String)
    case failedToDownloadContentOfFile
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
}
