//
//  MockLoginInteractor.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockLoginInteractor: LoginInteractorProtocol {
    var lastRequest: LoginRequest?

    func login(request: LoginRequest) {
        lastRequest = request
    }
}
