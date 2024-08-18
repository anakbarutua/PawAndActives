//
//  TrackingPoint.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 18/08/24.
//

import Foundation

struct TrackingPoint: Codable, Hashable {
    var leftHand: [CGPoint]? = nil
    var rightHand: [CGPoint]? = nil
    var head: [CGPoint]? = nil
}
