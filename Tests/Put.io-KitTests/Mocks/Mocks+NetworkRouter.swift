//
//  Mocks+MetworkRouter.swift
//  Put.io-KitTests
//
//  Created by Ilias Pavlidakis on 27/09/2019.
//

import Foundation
import NetworkMe
import Put_io_Kit

extension PutioKit.Mocks {

    struct NetworkStack {

        let router: NetworkMe.Router
        let urlSession: PutioKit.Stubs.URLSession
        let fileRetriever: PutioKit.Stubs.FileRetriever
        let queues: [NetworkMe.Priority: PutioKit.Stubs.OperationQueue]

        init() {

            self.urlSession = PutioKit.Stubs.URLSession()
            self.fileRetriever = PutioKit.Stubs.FileRetriever()
            self.queues = [
                NetworkMe.Priority.high: PutioKit.Stubs.OperationQueue(),
                NetworkMe.Priority.normal: PutioKit.Stubs.OperationQueue(),
                NetworkMe.Priority.low: PutioKit.Stubs.OperationQueue(),
            ]

            self.router = NetworkMe.Router(
                urlSession: self.urlSession,
                fileRetriever: self.fileRetriever,
                middleware: [],
                queues: self.queues)
        }
    }
}
