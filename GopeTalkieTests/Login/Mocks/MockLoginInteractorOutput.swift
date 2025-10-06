//
//  MockLoginInteractorOutput.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockLoginInteractorOutput: LoginInteractorOutputProtocol {
    var lastSuccessToken: LoginResponse?
    var receivedError: Error?
    var onSuccess: (() -> Void)?
    var onFailure: (() -> Void)?

    func loginSucceeded(with token: LoginResponse) {
        lastSuccessToken = token
        onSuccess?()
    }

    func loginFailed(with error: Error) {
        receivedError = error
        onFailure?()
    }
}
