//
//  WebSocketServiceProtocol.swift
//  GopeTalkie
//
//  Created by Gopenux on 17/07/25.
//

import Foundation

protocol WebSocketServiceProtocol {
    var delegate: WebSocketServiceDelegate? { get set }
    func connect(to channel: String)
    func send(message: String)
    func send(data: Data)
    func disconnect()
}
