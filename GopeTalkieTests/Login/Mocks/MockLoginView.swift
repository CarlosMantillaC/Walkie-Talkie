//
//  MockLoginView.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockLoginView: LoginViewProtocol {
    var lastErrorMessage: String?

    func showError(_ message: String) {
        lastErrorMessage = message
    }
}
