//
//  Stubs+Router.swift
//  Put.io-KitTests
//
//  Created by Ilias Pavlidakis on 27/09/2019.
//

import Foundation
import NetworkMe
import Put_io_Kit

extension PutioKit.Stubs {

    final class Router{

        private(set) var addWasCalledWithMiddleware: MiddlewareProtocol?
        private(set) var cancelRequestsWasCalledWithPriorities: [NetworkMe.Priority]?
        private(set) var requestWasCalledWithEndpoint: EndpointProtocol?
        private(set) var requesWithCompletiontWasCalledWithEndpoint: EndpointProtocol?
    }
}

extension PutioKit.Stubs.Router : Routing  {

    func add(middleware: MiddlewareProtocol) {

        addWasCalledWithMiddleware = middleware
    }

    func cancelRequests(with priorities: [NetworkMe.Priority]) {

        cancelRequestsWasCalledWithPriorities = priorities
    }

    func request(endpoint: EndpointProtocol) {

        requestWasCalledWithEndpoint = endpoint
    }

    func request<ResultItem>(
        endpoint: EndpointProtocol,
        completion: @escaping (Result<ResultItem, NetworkMe.Router.NetworkError>, [NetworkMe.Header.Response]?) -> Void) where ResultItem : Decodable {

        requesWithCompletiontWasCalledWithEndpoint = endpoint
    }
}
