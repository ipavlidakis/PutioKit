//
//  Stubs+FileRetriever.swift
//  Put.io-KitTests
//
//  Created by Ilias Pavlidakis on 27/09/2019.
//

import Foundation
import NetworkMe
import Put_io_Kit

extension PutioKit.Stubs {

    final class FileRetriever {

        private(set) var fetchDataWasCalledWithURL: URL?
        var stubFetchDataResult: Data?
    }
}

extension PutioKit.Stubs.FileRetriever: FileRetrieving {

    func fetchData(from url: URL) -> Data? {

        fetchDataWasCalledWithURL = url

        return stubFetchDataResult
    }
}
