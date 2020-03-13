//
//  CredentialsStore.swift
//  Put.io-Kit Reference App
//
//  Created by Ilias Pavlidakis on 05/03/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

public protocol CredentialsStoring {

    var accessToken: String? { get }
}
