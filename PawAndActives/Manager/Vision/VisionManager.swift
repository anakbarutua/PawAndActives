//
//  VisionManager.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import Vision

class VisionManager: VisionService {
    let facePoseRequest = VNDetectFaceLandmarksRequest()
    
    func performFaceTracking(on pixelBuffer: CVPixelBuffer, completion: @escaping ([CGPoint]) -> Void) {
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        
        do {
            try handler.perform([facePoseRequest])
            guard let observations = facePoseRequest.results else {
                completion([])
                return
            }
            
            var facePoints: [CGPoint] = []
            
            for observation in observations {
                if let landmarks = observation.landmarks {
                    let allPoints = [landmarks.leftEye, landmarks.rightEye, landmarks.nose, landmarks.outerLips, landmarks.innerLips].compactMap { $0 }
                    
                    for feature in allPoints {
                        let points = VisionHelper.convertFacePoint(points: feature.normalizedPoints, observation: observation)
                        facePoints.append(contentsOf: points)
                    }
                }
            }
            
            completion(facePoints)
        } catch {
            print("Face tracking error: \(error)")
            completion([])
        }
    }
}
