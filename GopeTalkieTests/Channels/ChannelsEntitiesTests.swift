//
//  ChannelsEntitiesTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/08/25.
//

import XCTest
@testable import GopeTalkie

final class ChannelsEntitiesTests: XCTestCase {
    
    func testChannelsInitialization() {
        let name = "canal 1"
        
        let channel = Channel(name: name)
        
        XCTAssertEqual(channel.name, name)
    }
}
