//
//  AudioService.swift
//  GopeTalkie
//
//  Created by Gopenux on 17/07/25.
//

import Foundation

protocol AudioServiceProtocol {
    func startStreaming(to socket: WebSocketServiceProtocol)
    func stopStreaming()
    func playAudioData(_ data: Data)
}
