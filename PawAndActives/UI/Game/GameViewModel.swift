//
//  GameViewModel.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftUI
import AVFoundation
import Combine

class GameViewModel: ObservableObject {
    
    @Published var handPoints: [CGPoint] = []
    @Published var leftHand: [CGPoint] = []
    @Published var rightHand: [CGPoint] = []
    @Published var head: [CGPoint] = []
    
    @Published var isTrackingOk = false
    
    var cameraManager: CameraManager
    
    @Published var isSessionRunning = false
    @Published var remainingTime: TimeInterval = 60.0
    @Published var circles: [Circles] = []
    @Published var score: Int = 0
    @Published var capturedFrame: UIImage?
    
    @Published var sections: [Bool] = []
    @Published var userState: UserState = .waitingToStart
    
    @Published var countdownText: String = "Ready"
    @Published var countdown: Int = 4
    
    private var currentNonRedIndex: Int = 0
    
    private var cancellables = Set<AnyCancellable>()
    private var timerCancellable: AnyCancellable?
    @Published var startCountdownCancellable: AnyCancellable?
        
    var objectAppearInterval: TimeInterval = 0.75
    var circleLifetime: TimeInterval = 1.0
    
    var blockRow: CGFloat = 3
    var blockColumn: CGFloat = 3
    var totalColumn = 4
    
    var userDifficulty : Level = .easy
    var workoutType: WorkoutType = .grabTheCircles
    
    @Published var maxObstacle = 0
    
    init() {
        cameraManager = CameraManager()
        setupBindings()
        maxObstacle = 0
    }
    
    private func setUpLevel() {
        switch userDifficulty {
        case .easy:
            if workoutType == .grabTheCircles {
                self.objectAppearInterval = 2
                self.circleLifetime = 3
            } else {
                self.blockRow = 3
                self.blockColumn = 3
                self.objectAppearInterval = 3
            }
        case .medium:
            if workoutType == .grabTheCircles {
                self.objectAppearInterval = 1.5
                self.circleLifetime = 2
            } else {
                self.blockRow = 4
                self.blockColumn = 4
                self.objectAppearInterval = 2.5
            }
        case .hard:
            if workoutType == .grabTheCircles {
                self.objectAppearInterval = 0.75
                self.circleLifetime = 1.5
            } else {
                self.blockRow = 5
                self.blockColumn = 5
                self.objectAppearInterval = 2
            }
        }
        
        totalColumn = Int(self.blockColumn * self.blockRow)
        sections = Array(repeating: true, count: totalColumn)
    }
    
    private func setupBindings() {
        cameraManager.onTrackingPointsDetected = { [weak self] points in
            if self?.userState == .waitingToStart {
                self?.handleDistance(points)
            } else if self?.userState == .started {
                self?.handleHandPoints(points)
            }
        }
        
        cameraManager.onTrackingPointsNotDetected = {
            DispatchQueue.main.async {
                self.handPoints = []
            }
        }
   }
    
    func startCamera() {
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
    
    func handleDistance(_ points: TrackingPoint) {
        DispatchQueue.main.async { [self] in
            if workoutType == .grabTheCircles {
                guard let leftHandPoint = points.leftHand, let rightHandPoint = points.rightHand else { return }
                blockColumn = 4
                blockRow = 4
                
                let isLeftInPosition = checkPointInSpecificSection(row: 4, column: 4, choosenIndex: 12, points: leftHandPoint)
                let isRightInPosition = checkPointInSpecificSection(row: 4, column: 4, choosenIndex: 3, points: rightHandPoint)
                
                self.isTrackingOk = isLeftInPosition && isRightInPosition
                
            } else {
                guard let headPoint = points.head else { return }
                blockColumn = 5
                blockRow = 5
                
                let isHeadInPosition = checkPointInSpecificSection(row: 5, column: 5, choosenIndex: 7, points: headPoint)
                
                self.isTrackingOk = isHeadInPosition
            }
        }
    }
    
    func checkPointInSpecificSection(row: CGFloat, column: CGFloat, choosenIndex: Int, points: [CGPoint]) -> Bool {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let sectionWidth = screenWidth / column
        let sectionHeight = screenHeight / row
        
        let row = choosenIndex / Int(row)
        let col = choosenIndex % Int(column)
        
        let sectionX = CGFloat(col) * sectionWidth
        let sectionY = CGFloat(row) * sectionHeight
        
        let sectionRect = CGRect(x: sectionX, y: sectionY, width: sectionWidth, height: sectionHeight)
        
        // Check if all points are within the non-red section
        if !points.isEmpty {
            let allPointsInSection = points.allSatisfy { point in
                sectionRect.contains(point)
            }
            return allPointsInSection
        } else {
            return false
        }
        
    }
    
    func handleHandPoints(_ points: TrackingPoint) {
        DispatchQueue.main.async { [self] in
            
            if workoutType == .grabTheCircles {
                guard let leftHandPoint = points.leftHand, let rightHandPoint = points.rightHand else { return }
                self.handPoints = []
                self.handPoints = leftHandPoint
                self.handPoints.append(contentsOf: rightHandPoint)
                checkPointInRing(points: handPoints)
                
            } else {
                guard let headPoint = points.head else { return }
                self.handPoints = []
                self.handPoints = headPoint
                checkPointInNonRedSection(points: handPoints)
            }
        }
    }
    
    func checkPointInRing(points: [CGPoint]) {
        for point in points {
            if let index = self.circles.firstIndex(where: { $0.contains(point) }) {
                self.circles.remove(at: index)
                self.score += 1
                print("Score: \(self.score)")
            }
        }
    }
    
    func startGame() {
        self.timerCountDown()
        
        if remainingTime != 0 {
            if workoutType == .grabTheCircles {
                startGeneratingCircle()
            } else {
                self.randomizeNonRedSection()
                startGeneratingBlocks()
            }
        }
    }
    
    func startCountdown(workoutType: WorkoutType, userDifficulty: Level) {
        self.workoutType = workoutType
        self.userDifficulty = userDifficulty
        
        startCountdownCancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                print("Countdown: \(self.countdown)")
                if self.countdown > 1 {
                    self.countdown -= 1
                    self.countdownText = "\(self.countdown)"
                } else if self.countdown == 1 {
                    self.setUpLevel()
                    self.userState = .started
                    self.countdown -= 1
                } else {
                    startCountdownCancellable?.cancel()
                }
            }
    }
    
    private func timerCountDown() {
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.remainingTime > 0 {
                    self.remainingTime -= 1
                } else {
                    self.endGame()
                }
            }
            .store(in: &cancellables)
    }
    
    func getPreviewLayer() -> AVCaptureVideoPreviewLayer? {
        return cameraManager.getPreviewLayer()
    }
    
    private func startGeneratingCircle() {
        Timer.publish(every: objectAppearInterval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self, self.userState == .started else { return }
                self.generateCircle()
            }
            .store(in: &cancellables)
    }
    
    private func startGeneratingBlocks() {
        timerCancellable = Timer.publish(every: objectAppearInterval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.randomizeNonRedSection()
            }
    }
    
    private func resetSectionTimer() {
        timerCancellable?.cancel()
        startGeneratingBlocks()
    }
    
    private func generateCircle() {
        let numberOfCircles = Int.random(in: 1...2)
        maxObstacle += numberOfCircles
        var newCircles: [Circles] = []
        for _ in 0..<numberOfCircles {
            var newCircle: Circles
            repeat {
                newCircle = Circles(lifetime: circleLifetime)
            } while circles.contains(where: { $0.overlaps(with: newCircle) }) || newCircles.contains(where: { $0.overlaps(with: newCircle) })
            
            newCircles.append(newCircle)
            
        }
        
        circles.append(contentsOf: newCircles)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + circleLifetime) {
            self.circles.removeAll { circle in
                newCircles.contains { $0.id == circle.id }
            }
        }
    }
    
    private func randomizeNonRedSection() {
        // Reset all to red
        sections = Array(repeating: true, count: totalColumn)
        
        // Randomize one section to be non-red
        var random: Int
        repeat {
            random = Int.random(in: 0..<totalColumn)
        } while currentNonRedIndex == random
        
        print("Random: \(random)")
        currentNonRedIndex = random
        sections[currentNonRedIndex] = false
        maxObstacle += 1
        print("MaxObstacle: \(maxObstacle)")
        
    }
    
    func checkPointInNonRedSection(points: [CGPoint]) {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let sectionWidth = screenWidth / self.blockColumn
        let sectionHeight = screenHeight / self.blockRow
        
        let row = currentNonRedIndex / Int(self.blockRow)
        let col = currentNonRedIndex % Int(self.blockColumn)
        
        let sectionX = CGFloat(col) * sectionWidth
        let sectionY = CGFloat(row) * sectionHeight
        
        let sectionRect = CGRect(x: sectionX, y: sectionY, width: sectionWidth, height: sectionHeight)
        
        // Check if all points are within the non-red section
        let allPointsInSection = points.allSatisfy { point in
            sectionRect.contains(point)
        }
        
        if allPointsInSection {
            score += 1
            self.randomizeNonRedSection()
            self.resetSectionTimer()
        }
    }
    
    func endGame() {
        // Capture the last frame
        if let lastFrame = cameraManager.captureCurrentFrame() {
            self.capturedFrame = lastFrame
        }
        
        // Stop the camera and end the game
        self.stopCamera()
        self.userState = .gameOver
        self.circles.removeAll()
        timerCancellable?.cancel()
    }
    
    func scoring() -> (percentage: Int, letter: Score) {
        let scorePercentage = Double(score) / Double(maxObstacle)
        
        if scorePercentage == 1.0 {
            return (percentage: Int(scorePercentage * 100), letter: .ss)
        } else if scorePercentage > 0.8 {
            return (percentage: Int(scorePercentage * 100), letter: .s)
        } else if scorePercentage >= 0.65 {
            return (percentage: Int(scorePercentage * 100), letter: .a)
        } else if scorePercentage >= 0.25 {
            return (percentage: Int(scorePercentage * 100), letter: .b)
        } else {
            return (percentage: Int(scorePercentage * 100), letter: .c)
        }
    }
}
