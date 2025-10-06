//
//  LoginInteractorTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

final class LoginInteractorTests: XCTestCase {
    var interactor: LoginInteractor!
    var mockRepository: MockLoginRepository!
    var mockPresenter: MockLoginInteractorOutput!

    override func setUp() {
        super.setUp()
        
        mockRepository = MockLoginRepository()
        mockPresenter = MockLoginInteractorOutput()
        interactor = LoginInteractor(repository: mockRepository)
        
        interactor.presenter = mockPresenter
    }

    func testLoginSuccessNotifiesPresenter() {
        let expectation = self.expectation(description: "login success")

        let expectedResponse = LoginResponse(token: "abc123")
        mockRepository.resultToReturn = .success(expectedResponse)
        mockPresenter.onSuccess = {
            expectation.fulfill()
        }

        let request = LoginRequest(email: "user@test.com", password: "123456")
        interactor.login(request: request)

        waitForExpectations(timeout: 1.0)

        XCTAssertEqual(mockRepository.capturedRequest?.email, "user@test.com")
        XCTAssertEqual(mockPresenter.lastSuccessToken?.token, "abc123")
    }

    func testLoginFailureNotifiesPresenter() {
        let expectation = self.expectation(description: "login failure")

        let expectedError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error de login"])
        mockRepository.resultToReturn = .failure(expectedError)
        mockPresenter.onFailure = {
            expectation.fulfill()
        }

        let request = LoginRequest(email: "user@test.com", password: "123456")
        interactor.login(request: request)

        waitForExpectations(timeout: 1.0)

        XCTAssertEqual(mockPresenter.receivedError?.localizedDescription, "Error de login")
    }
}
