//
//  RegisterRepositoryTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

final class RegisterRepositoryTests: XCTestCase {
    var repository: RegisterRepository!
    var session: URLSession!
    var request: RegisterRequest!

    override func setUp() {
        super.setUp()

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [StubURLProtocol.self]
        session = URLSession(configuration: config)
        repository = RegisterRepository(session: session)
        request = RegisterRequest(
            firstName: "Ana",
            lastName: "Gómez",
            email: "ana@mail.com",
            password: "123456",
            confirmPassword: "123456"
        )
    }

    func testRegisterSuccessResponse() {
        let expectedMessage = "Registro exitoso"
        let response = RegisterResponse(message: expectedMessage)
        let responseData = try! JSONEncoder().encode(response)
        
        StubURLProtocol.stubResponseData = responseData
        StubURLProtocol.stubError = nil

        let expectation = self.expectation(description: "register completes")

        repository.register(user: request) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.message, expectedMessage)
            case .failure:
                XCTFail("Expected success, got failure")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    func testRegisterReturnsAPIError() {
        let errorResponse = RegisterAPIErrorResponse(error:  "Correo ya registrado")
        let responseData = try! JSONEncoder().encode(errorResponse)

        StubURLProtocol.stubResponseData = responseData
        StubURLProtocol.stubError = nil

        let expectation = self.expectation(description: "register completes")

        repository.register(user: request) { result in
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "Correo ya registrado")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    func testRegisterHandlesNetworkError() {
        let networkError = NSError(domain: "Network", code: -1009, userInfo: [NSLocalizedDescriptionKey: "Sin conexión"])
        
        StubURLProtocol.stubError = networkError
        StubURLProtocol.stubResponseData = nil

        let expectation = self.expectation(description: "register completes")

        repository.register(user: request) { result in
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "Sin conexión")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }
}
