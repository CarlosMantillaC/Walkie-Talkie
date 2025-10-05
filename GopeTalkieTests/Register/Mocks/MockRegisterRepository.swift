//
//  MockRegisterRepository.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

class MockRegisterRepository: RegisterRepositoryProtocol {
    var capturedRequest: RegisterRequest?
    var resultToReturn: Result<RegisterResponse, Error>?

    func register(user: RegisterRequest, completion: @escaping (Result<RegisterResponse, Error>) -> Void) {
        capturedRequest = user
        if let result = resultToReturn {
            completion(result)
        }
    }
}
