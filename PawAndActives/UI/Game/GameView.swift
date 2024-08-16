//
//  GameView.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    @StateObject private var viewModel = GameViewModel()
    
    var workoutType: WorkoutType = .avoidTheBlocks
    var userDifficulty : Level = .easy
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if let capturedFrame = viewModel.capturedFrame, viewModel.userState == .gameOver {
                    Image(uiImage: capturedFrame)
                        .resizable()
                        .scaledToFill()
                        .offset(CGSize(width: -140.0, height: 0.0))
                        .clipped()
                        .edgesIgnoringSafeArea(.all)
                    
                } else {
                    CameraPreview(viewModel: viewModel)
                        .onAppear {
                            viewModel.startCamera()
                        }
                }
                
                switch viewModel.userState {
                case .waitingToStart:
                    VStack {
                        Text("Heheh")
                    }
                case .countdown:
                    VStack {
                        Text(viewModel.countdownText)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                case .started:
                    if workoutType == .grabTheCircles {
                        ForEach(viewModel.circles) { circle in
                            Circle()
                                .frame(width: circle.size, height: circle.size)
                                .position(circle.position)
                                .foregroundColor(.red)
                        }
                    } else {
                        ForEach(0..<viewModel.totalColumn) { index in
                            Rectangle()
                                .fill(viewModel.sections[index] ? Color.red.opacity(0.4) : Color.clear)
                                .frame(width: UIScreen.main.bounds.width / viewModel.blockColumn, height: UIScreen.main.bounds.height / viewModel.blockRow)
                                .position(positionForSection(index: index))
                        }
                        
                    }
                case .gameOver:
                    VStack {
                        Text("Score : \(viewModel.score)")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                            .padding()
                        
                        Button("Back to Dashboard") {
                            navigationManager.goBackToRoot()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(CGSize(width: -140.0, height: 0.0))
                    .background(Color.black.opacity(0.75))
                }
                
                // Score display
                VStack {
                    VStack {
                        Text("Score: \(viewModel.score)")
                            .font(.largeTitle)
                        
                        Text("\(updateTimeFormat(remainingTime: viewModel.remainingTime))")
                            .font(.headline)
                            .onTapGesture {
                                viewModel.userState = .countdown
                            }
                    }
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .padding()
                }
                .position(x: UIScreen.main.bounds.width / 2, y: 50)
                
            }
            .edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            viewModel.workoutType = workoutType
        }
        .onChange(of: viewModel.userState) { _, newState in
            switch newState {
            case .waitingToStart:
                break
            case .countdown:
                viewModel.startCountdown(
                    workoutType: workoutType,
                    userDifficulty: userDifficulty
                )
            case .started:
                viewModel.startGame()
            case .gameOver:
                viewModel.endGame()
                break
            }
        }
        .onDisappear {
            viewModel.endGame()
        }
    }
    
    private func positionForSection(index: Int) -> CGPoint {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let sectionWidth = screenWidth / viewModel.blockColumn
        let sectionHeight = screenHeight / viewModel.blockRow
        
        let row = index / Int(viewModel.blockRow)
        let col = index % Int(viewModel.blockColumn)
        
        let x = (CGFloat(col) + 0.5) * sectionWidth
        let y = (CGFloat(row) + 0.5) * sectionHeight
        
        return CGPoint(x: x, y: y)
    }
}

#Preview {
    GameView()
}
