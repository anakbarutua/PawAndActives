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
    
    func performFaceTracking(on pixelBuffer: CVPixelBuffer, completion: @escaping (TrackingPoint) -> Void) {
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        do {
            try handler.perform([facePoseRequest])
            guard let observations = facePoseRequest.results else {
                completion(TrackingPoint())
                return
            }
            
            var facePoints: [CGPoint] = []
            
            if let bestObservation = observations.sorted(by: { $0.confidence > $1.confidence }).first {
                if let landmarks = bestObservation.landmarks {
                    // Extract all available landmark points
                    let allLandmarks = [
                        landmarks.leftEyebrow,
                        landmarks.rightEyebrow,
                        landmarks.leftEye,
                        landmarks.rightEye,
                        landmarks.nose,
                        landmarks.noseCrest,
                        landmarks.outerLips,
                        landmarks.innerLips,
                        landmarks.leftPupil,
                        landmarks.rightPupil
                    ].compactMap { $0 } // Remove nil entries
                    
                    for feature in allLandmarks {
                        let points = VisionHelper.convertFacePoint(points: feature.normalizedPoints, observation: bestObservation)
                        facePoints.append(contentsOf: points)
                    }
                }
            }
            
            let parsedPoint = TrackingPoint(head: facePoints)
            
            completion(parsedPoint)
        } catch {
            print("Face tracking error: \(error)")
            completion(TrackingPoint())
        }
    }
    
    func performHandTracking(on pixelBuffer: CVPixelBuffer, completion: @escaping (TrackingPoint) -> Void) {
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])
        
        handPoseRequest.maximumHandCount = 2
        do {
            try handler.perform([handPoseRequest])
            
            guard let handObservations = handPoseRequest.results else {
                completion(TrackingPoint())
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
            
            var leftHandPoints: [VNRecognizedPoint] = []
            var rightHandPoints: [VNRecognizedPoint] = []
            
            for observation in handObservations {
                let allPoints = try observation.recognizedPoints(forGroupKey: .point3DGroupKeyAll)
                
                for point in allPoints.values {
                    if point.confidence > 0.5 {
                        if point.location.x <= 0.5 {
                            leftHandPoints.append(point)
                        } else {
                            rightHandPoints.append(point)
                        }
                    }
                }
            }
            
            let leftCGPoints = VisionHelper.convertPointsToCGPoint(points: leftHandPoints)
            let rightCGPoints = VisionHelper.convertPointsToCGPoint(points: rightHandPoints)
            
            let parsedPoint = TrackingPoint(leftHand: leftCGPoints, rightHand: rightCGPoints)
            completion(parsedPoint)
        } catch {
            print("Hand tracking error: \(error)")
            completion(TrackingPoint())
        }
    }
}
