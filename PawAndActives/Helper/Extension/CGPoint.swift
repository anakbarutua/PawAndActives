//
//  CGPoint.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 14/08/24.
//

import Foundation
import SwiftUI

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }

    public static func == (lhs: CGPoint, rhs: CGPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
