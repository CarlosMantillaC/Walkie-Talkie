//
//  MockRegisterView.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

class MockRegisterView: RegisterViewProtocol {
    var successMessage: String?
    var errorMessage: String?
    
    func showSuccess(message: String) {
        successMessage = message
    }

    func showError(_ error: String) {
        errorMessage = error
    }
}
