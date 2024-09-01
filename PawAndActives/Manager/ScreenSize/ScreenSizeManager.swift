//
//  ScreenSizeManager.swift
//  PawAndActives
//
//  Created by Nadya Margareth Angkawijaya on 31/08/24.
//

import Foundation

class ScreenSizeManager{
    static let shared = ScreenSizeManager()
    
    private init() {}
    
    func getScreenCategory(for width: CGFloat, and height: CGFloat) -> ScreenCategory {
        switch (width, height) {
        case (let w, let h) where h <= 768 && w <= 1133:
            return .extraSmall // iPad mini
        case (let w, let h) where h <= 810 && w <= 1080:
            return .small // iPad 10.2
        case (let w, let h) where h <= 834 && w <= 1112:
            return .medium // iPad 10.5
        case (let w, let h) where h <= 834 && w <= 1210:
            return .large //iPad 11
        case (let w, let h) where h <= 1032 && w <= 1376:
            return .extraLarge// iPad 13
        default: return .large
        }
    }
}

