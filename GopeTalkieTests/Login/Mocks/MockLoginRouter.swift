//
//  MockLoginRouter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockLoginRouter: LoginRouterProtocol {
    var didNavigateToHome = false
    var didNavigateToRegister = false

    static func createModule() -> UIViewController {
        return UIViewController()
    }

    func navigateToHome(from view: LoginViewProtocol) {
        didNavigateToHome = true
    }

    func navigateToRegister(from view: LoginViewProtocol) {
        didNavigateToRegister = true
    }
}
