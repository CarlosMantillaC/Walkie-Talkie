//
//  MockChannelsInteractorOutput.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelsInteractorOutput: ChannelsInteractorOutput {
    var loadedChannels: [Channel]?
    var receivedError: Error?
    var logoutMessage: String?

    func didLoadChannels(_ channels: [Channel]) {
        loadedChannels = channels
    }

    func didFailLoadingChannels(error: Error) {
        receivedError = error
    }

    func logoutSucceeded(message: String) {
        logoutMessage = message
    }
}
