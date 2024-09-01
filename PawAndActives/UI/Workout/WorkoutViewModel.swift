//
//  WorkoutViewModel.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI
import Foundation
import AVFoundation
import AVKit
import Combine



class WorkoutViewModel: ObservableObject{
    @Published var showPermissionAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    
    @Published var workoutType: WorkoutType = .grabTheCircles
    
    @Published var highScore: ScoreDetail?
    
    @Published var currentDifficulty: Level = Level.medium
    
    @Published var isFirstGame: Bool = true
    
//    private let workoutRepositoryService: WorkoutRepositoryManager
//    private let gameRepositoryService: GameRepositoryManager
    
    private let repoManager: JokesCollectionManager
    
    
    init(repoManager: JokesCollectionManager) {
//        self.workoutRepositoryService = workoutRepositoryService
//        self.gameRepositoryService = gameRepositoryService
        self.repoManager = repoManager
    }
    
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
    
    func fetchHighScore() {
        if let highScoreSession = repoManager.fetchHighScore(workout: workoutType) {
            self.highScore = highScoreSession.score
        }
    }
    
    func fetchCurrentDifficulty() {
        if let currentDifficulty = repoManager.fetchWorkoutDifficulty(workout: workoutType).first {
            self.currentDifficulty = Level(rawValue: currentDifficulty.currentDifficulty)!
        }
    }
    
    func addLevelDifficulties() {
        if isFirstGame {
            repoManager.addDifficulty(
                WorkoutDifficulties(
                    workoutType: .avoidTheBlocks, currentDifficulty: .medium
                )
            )
            
            repoManager.addDifficulty(
                WorkoutDifficulties(
                    workoutType: .grabTheCircles, currentDifficulty: .medium
                )
            )
            
            isFirstGame = false
        }
    }
}
