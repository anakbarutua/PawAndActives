//
//  Util.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation

func updateTimeFormat(remainingTime: TimeInterval) -> String {
    let minutes = Int(remainingTime) / 60
    let seconds = Int(remainingTime) % 60
    return String(format: "%02d:%02d", minutes, seconds)
}
