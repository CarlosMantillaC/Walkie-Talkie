//
//  MockChannelsRepository.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelsRepository: ChannelsRepositoryProtocol {
    var resultToReturn: Result<[Channel], Error>?

    func fetchChannels(completion: @escaping (Result<[Channel], Error>) -> Void) {
        if let result = resultToReturn {
            completion(result)
        }
    }
}
