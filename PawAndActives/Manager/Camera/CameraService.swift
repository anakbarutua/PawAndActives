//
//  CameraService.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import AVFoundation
import UIKit

protocol CameraService {
    
    var onTrackingPointsDetected: (([CGPoint]) -> Void)? { get set }
    var onTrackingPointsNotDetected: (() -> Void)? { get set }
    var workoutType: WorkoutType { get set }
    
    func startSession(workoutType: WorkoutType)
    func stopSession()
    func getPreviewLayer() -> AVCaptureVideoPreviewLayer?
    func captureCurrentFrame() -> UIImage?
}
