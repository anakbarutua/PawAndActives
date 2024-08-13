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
    
    var cameraManager: CameraService
    
    @Published var isSessionRunning = false
    
    init() {
        cameraManager = CameraManager()
    }
    
    func startCamera() {
        cameraManager.startSession()
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
