//
//  Stubs+RequestModels.swift
//  NetworkMe
//
//  Created by Ilias Pavlidakis on 28/09/2019.
//

import Foundation
import Put_io_Kit

extension PutioKit.Stubs {

    enum RequestModel {}
}

extension PutioKit.Stubs.RequestModel {

    static let fileList = FileListParametersModel(parentId: nil, perPage: nil, sortBy: nil, contentType: nil, fileType: nil)
}
