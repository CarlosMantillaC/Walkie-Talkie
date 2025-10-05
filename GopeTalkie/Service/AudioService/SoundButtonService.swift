//
//  SoundButtonService.swift
//  GopeTalkie
//
//  Created by Gopenux on 31/07/25.
//

import Foundation
import AVFoundation
import os

final class SoundButtonService {
    private var audioPlayer: AVAudioPlayer?

    private let logger = Logger(subsystem: "com.gopenux.GopeTalkie", category: "SoundButtonService")

    func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: nil) else {
            logger.error("No se encontró el sonido: \(name, privacy: .public)")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            logger.error("Error al reproducir el sonido: \(error, privacy: .public)")
        }
    }
}
