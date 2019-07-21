//
//  Encodable+ConcreteType.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 23/06/2019.
//  Copyright © 2019 Ilias Pavlidakis. All rights reserved.
//

import Foundation

extension Encodable {

    var concreteType: some Encodable { return self }
}
