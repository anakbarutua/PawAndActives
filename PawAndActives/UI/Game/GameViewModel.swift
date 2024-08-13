//
//  GameViewModel.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftUI
import AVFoundation

class GameViewModel: ObservableObject {
    
    @Published var handPoints: [CGPoint] = []
    var cameraManager: CameraManager
    
    @Published var isSessionRunning = false
    
    var workoutType: WorkoutType = .grabTheCircles
    
    init() {
        cameraManager = CameraManager()
        cameraManager.onTrackingPointsDetected = { [weak self] points in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.handPoints = points
                
            }
        }
        
        cameraManager.onTrackingPointsNotDetected = {
            DispatchQueue.main.async {
                self.handPoints = []
            }
        }
    }
    
    func startCamera(workoutType: WorkoutType) {
        cameraManager.startSession(workoutType: workoutType)
        DispatchQueue.main.async {
            self.isSessionRunning = true
        }
    }
    
    func stopCamera() {
        cameraManager.stopSession()
        DispatchQueue.main.async {
            self.isSessionRunning = false
        }
    }
    
    func getPreviewLayer() -> AVCaptureVideoPreviewLayer? {
        return cameraManager.getPreviewLayer()
    }
}
