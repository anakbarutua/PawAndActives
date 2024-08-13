//
//  VisionHelper.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import Vision

class VisionHelper {    
    static func convertFacePoint(points: [CGPoint], observation: VNFaceObservation) -> [CGPoint] {
        return points.map { point in
            CGPoint(x: point.x * observation.boundingBox.width + observation.boundingBox.origin.x,
                           y: 1 - (point.y * observation.boundingBox.height + observation.boundingBox.origin.y))
        }
    }
    
    static func convertPointsToCGPoint(points: [VNRecognizedPoint]) -> [CGPoint] {
        return points.map { point in
            let x = point.location.x
            let y = (1 - point.location.y)
            return CGPoint(x: x, y: y)
        }
    }
}
