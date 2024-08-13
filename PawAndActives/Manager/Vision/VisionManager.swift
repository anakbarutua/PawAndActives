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
    let handPoseRequest = VNDetectHumanHandPoseRequest()
    
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
    
    func performHandTracking(on pixelBuffer: CVPixelBuffer, completion: @escaping ([CGPoint]) -> Void) {
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])
        
        do {
            try handler.perform([handPoseRequest])
            
            guard let handObservations = handPoseRequest.results else {
                completion([])
                return
            }
            
            var handPoints: [VNRecognizedPoint] = []
            
            for observation in handObservations {
                let allPoints = try observation.recognizedPoints(forGroupKey: .point3DGroupKeyAll)
                
                for point in allPoints.values {
                    if point.confidence > 0.5 {
                        handPoints.append(point)
                    }
                }
                
                handPoints.append(contentsOf: allPoints.values)
            }
            
            let cgPoints = VisionHelper.convertPointsToCGPoint(points: handPoints)
            completion(cgPoints)
        } catch {
            print("Hand tracking error: \(error)")
            completion([])
        }
    }
}
