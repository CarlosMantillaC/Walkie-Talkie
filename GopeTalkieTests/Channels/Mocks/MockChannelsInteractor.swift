//
//  MockChannlesInteractor.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelsInteractor: ChannelsInteractorProtocol {
    var loadChannelsCalled = false
    var logoutCalled = false

    func loadChannels() {
        loadChannelsCalled = true
    }

    func logout() {
        logoutCalled = true
    }
}
