//
//  SoundService.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 20/08/24.
//

import Foundation

protocol SoundService {
    func playSound(named soundName: String)
    func stopSound(named soundName: String)
    func pauseSound(named soundName: String)
    func resumeSound(named soundName: String)
    func setVolume(named soundName: String, volume: Float)
}
