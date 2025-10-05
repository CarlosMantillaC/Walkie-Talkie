//
//  MockRegisterInteractorOutput.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

class MockRegisterInteractorOutput: RegisterInteractorOutputProtocol {
    var successMessage: String?
    var receivedError: Error?
    var onSuccess: (() -> Void)?
    var onFailure: (() -> Void)?

    func registerSuccess(message: String) {
        successMessage = message
        onSuccess?()
    }

    func registerFailed(with error: Error) {
        receivedError = error
        onFailure?()
    }
}
