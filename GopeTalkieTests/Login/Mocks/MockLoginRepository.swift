//
//  MockLoginRepository.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockLoginRepository: LoginRepositoryProtocol {
    var capturedRequest: LoginRequest?
    var resultToReturn: Result<LoginResponse, Error>?

    func login(request: LoginRequest, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        capturedRequest = request
        if let result = resultToReturn {
            completion(result)
        }
    }
}
