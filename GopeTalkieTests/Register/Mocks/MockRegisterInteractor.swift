//
//  MockRegisterInteractor.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

class MockRegisterInteractor: RegisterInteractorProtocol {
    var lastRegisterRequest: RegisterRequest?

    func register(user: RegisterRequest) {
        lastRegisterRequest = user
    }
}
