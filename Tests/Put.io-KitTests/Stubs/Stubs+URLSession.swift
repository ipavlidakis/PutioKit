//
//  Stubs+URLSession.swift
//  Put.io-KitTests
//
//  Created by Ilias Pavlidakis on 27/09/2019.
//

import Foundation
import NetworkMe
import Put_io_Kit

extension PutioKit.Stubs {

    final class URLSession {

        var stubDataTaskResult = URLSessionDataTask()
        var stubUploadTaskResult = URLSessionUploadTask()
        var stubDownloadTaskResult = URLSessionDownloadTask()

        private(set) var dataTaskWasCalledWithRequest: URLRequest?
        var stubDataTaskCompletionHandler: (data: Data?, response: URLResponse?, error: Error?)?

        private(set) var uploadTaskWasCalledWithRequest: (request: URLRequest?, bodyData: Data?)?
        var stubUploadTaskCompletionHandler: (data: Data?, response: URLResponse?, error: Error?)?

        private(set) var downloadTaskWasCalledWithRequest: URLRequest?
        var stubDownloadTaskCompletionHandler: (url: URL?, response: URLResponse?, error: Error?)?
    }
}

extension PutioKit.Stubs.URLSession: URLSessionProtocol {

    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {

        dataTaskWasCalledWithRequest = request
        completionHandler(
            stubDataTaskCompletionHandler?.data,
            stubDataTaskCompletionHandler?.response,
            stubDataTaskCompletionHandler?.error)

        return stubDataTaskResult
    }

    func uploadTask(
        with request: URLRequest,
        from bodyData: Data?,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionUploadTask {

        uploadTaskWasCalledWithRequest = (request, bodyData)
        completionHandler(
            stubUploadTaskCompletionHandler?.data,
            stubUploadTaskCompletionHandler?.response,
            stubUploadTaskCompletionHandler?.error)

        return stubUploadTaskResult
    }

    func downloadTask(
        with request: URLRequest,
        completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadTask {

        downloadTaskWasCalledWithRequest = request
        completionHandler(
            stubDownloadTaskCompletionHandler?.url,
            stubDownloadTaskCompletionHandler?.response,
            stubDownloadTaskCompletionHandler?.error)

        return stubDownloadTaskResult
    }
}
