//
//  SoundManager.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 20/08/24.
//

import Foundation
import AVFoundation

class SoundManager: SoundService {
    private var audioPlayers: [String: AVAudioPlayer] = [:]

    func playSound(named soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayers[soundName] = audioPlayer
            audioPlayer.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }

    func stopSound(named soundName: String) {
        audioPlayers[soundName]?.stop()
        audioPlayers.removeValue(forKey: soundName)
    }

    func pauseSound(named soundName: String) {
        audioPlayers[soundName]?.pause()
    }

    func resumeSound(named soundName: String) {
        audioPlayers[soundName]?.play()
    }

    func setVolume(named soundName: String, volume: Float) {
        audioPlayers[soundName]?.volume = volume
    }
}
