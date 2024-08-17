//
//  WorkoutViewModel.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI
import Foundation
import AVFoundation

class WorkoutViewModel: ObservableObject{
    @Published var showPermissionAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    
    func requestCameraPermission() {
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch cameraAuthorizationStatus {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    if granted {
                        self.alertTitle = "Success"
                        self.alertMessage = "Camera access granted."
                    } else {
                        self.alertTitle = "Access Denied"
                        self.alertMessage = "Camera access was denied. Please enable it in Settings."
                    }
                    //self.showPermissionAlert = true
                }
            }
        case .restricted:
            DispatchQueue.main.async {
                self.alertTitle = "Access Restricted"
                self.alertMessage = "Camera access is restricted on this device."
                self.showPermissionAlert = true
            }
        case .denied:
            DispatchQueue.main.async {
                self.alertTitle = "Access Denied"
                self.alertMessage = "Camera access was previously denied. Please enable it in Settings."
                self.showPermissionAlert = true
            }
        case .authorized:
            DispatchQueue.main.async {
                self.alertTitle = "Already Authorized"
                self.alertMessage = "Camera access has already been authorized."
            }
        @unknown default:
            fatalError("Unknown camera authorization status.")
        }
    }
    
    func openSetting(){
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl){
            UIApplication.shared.open(settingsUrl)
        }
    }
}
