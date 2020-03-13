//
//  FilesServiceTests.swift
//  NetworkMe
//
//  Created by Ilias Pavlidakis on 27/09/2019.
//

import XCTest
import Put_io_Kit
import NetworkMe

final class FilesServiceTests: XCTestCase {

    private var networkStack: PutioKit.Mocks.NetworkStack! = PutioKit.Mocks.NetworkStack()
    private var stubApiClientModel: ApiClientModel! = PutioKit.Stubs.apiClientModel
    private lazy var service: FilesService! = FilesService(
        router: networkStack.router,
        clientModel: stubApiClientModel)

    override func tearDown() {

        networkStack = nil
        stubApiClientModel = nil
        service = nil

        super.tearDown()
    }
}

extension FilesServiceTests {

    // MARK: - fetchFiles

    func test_fetchFiles_validJSON_returnsFetchFilesModel() {

        networkStack.urlSession.stubDataTaskCompletionHandler = (
            PutioKit.Stubs.Responses.Files.fetchFiles.data(using: .utf8), nil, nil)

        service.fetchFiles(PutioKit.Stubs.RequestModel.fileList) { (response, error) in

            XCTAssertEqual(response?.total, 22)
            XCTAssertNil(response?.cursor)
            XCTAssertEqual(response?.status, "OK")
            XCTAssertEqual(response?.files.count, 22)
            XCTAssertNil(error)
        }
    }
}
