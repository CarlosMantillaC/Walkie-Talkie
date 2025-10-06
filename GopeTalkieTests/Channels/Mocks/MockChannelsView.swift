//
//  MockChannelsView.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelsView: ChannelsViewProtocol {
    var reloadDataCalled = false
    var shownErrorMessage: String?

    func reloadData() {
        reloadDataCalled = true
    }

    func showError(message: String) {
        shownErrorMessage = message
    }
}
