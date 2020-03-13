//
//  Stubs+OperationQueue.swift
//  Put.io-KitTests
//
//  Created by Ilias Pavlidakis on 27/09/2019.
//

import Foundation
import NetworkMe
import Put_io_Kit

extension PutioKit.Stubs {

    final class OperationQueue: Foundation.OperationQueue {

        override func addOperation(_ block: @escaping () -> Void) {
            block()
        }
    }
}
