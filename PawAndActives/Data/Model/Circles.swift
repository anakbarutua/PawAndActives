//
//  Circle.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 14/08/24.
//

import Foundation
import SwiftUI

struct Circles: Identifiable {
    let id = UUID()
    let position: CGPoint
    let size: CGFloat = 50.0
    let appearanceTime: Date
    
    init(lifetime: TimeInterval) {
        self.position = Circles.randomPosition()
        self.appearanceTime = Date().addingTimeInterval(lifetime)
    }
    
    func contains(_ point: CGPoint) -> Bool {
        let rect = CGRect(x: position.x - size / 2, y: position.y - size / 2, width: size, height: size)
        return rect.contains(point)
    }
    
    func overlaps(with other: Circles) -> Bool {
        let rect1 = CGRect(x: position.x - size / 2, y: position.y - size / 2, width: size, height: size)
        let rect2 = CGRect(x: other.position.x - other.size / 2, y: other.position.y - other.size / 2, width: other.size, height: other.size)
        return rect1.intersects(rect2)
    }
    
    private static func randomPosition() -> CGPoint {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let x = CGFloat.random(in: 100...(screenWidth - 100))
        let y = CGFloat.random(in: 100...(screenHeight - 100))
        return CGPoint(x: x, y: y)
    }
}
