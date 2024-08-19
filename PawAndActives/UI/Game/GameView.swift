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
    var userDifficulty : Level = .medium
    
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
                    if viewModel.isTrackingOk {
                        if viewModel.countdownText != "Ready" {
                            CircleView(width: 175, thickness: 15, color: Color.ABTColor.White)
                        }
                        
                        Text(viewModel.countdownText)
                            .font(.system(size: 128))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        VStack{
                            Text("Move your hands towards the circles in sequence")
                                .fontWeight(.heavy)
                                .font(.system(size: 24))
                                .frame(width: 290)
                                .padding(12)
                                .foregroundColor(Color.ABTColor.AntiFlashWhite)
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 34)
                                    .fill(Color.ABTColor.SteelBlue)
                                )
                               
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding([.trailing,.bottom], 40)
                        
                    }
                    switch workoutType {
                    case .grabTheCircles:
                        CircleView(width: 150, thickness: 15, color: Color.ABTColor.MikadoYellow)
                            .padding([.trailing, .top], UIScreen.main.bounds.width - (19 * UIScreen.main.bounds.width / 20))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        
                        CircleView(width: 150, thickness: 15, color: Color.ABTColor.MikadoYellow)
                            .padding([.leading, .bottom], UIScreen.main.bounds.width - (19 * UIScreen.main.bounds.width / 20))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                        
                    case .avoidTheBlocks:
                        CircleView(width: 175, thickness: 15, color: Color.ABTColor.MikadoYellow)
                            .padding([.top], UIScreen.main.bounds.height - (16 * UIScreen.main.bounds.height / 20))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    }
                    
                    VStack{
                        HStack{
                            Image(systemName: "figure.arms.open")
                                .resizable()
                                .frame(width: 70, height: 100)
                                .foregroundColor(Color.ABTColor.AntiFlashWhite)
                                .padding(.leading, 45)
                                
                            Text("POSITION YOUR HAND IN THE ORANGE CIRCLE TO START WORKOUT")
                                .font(.system(size: 23))
                                .fontWeight(.heavy)
                                .frame(width: 400, height: 140)
                                .foregroundColor(Color.ABTColor.AntiFlashWhite)
                                
                        }.background(
                            RoundedRectangle(
                                cornerRadius: 34)
                            .fill(Color.ABTColor.SteelBlue)
                        )
                        .padding([.trailing,.bottom],20)
                        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .bottomTrailing)
                        
                    }
                    
                    VStack{
                        HStack{
                            Image(systemName: "ipad.landscape")
                                .resizable()
                                .frame(width: 142, height:90)
                                .foregroundColor(Color.ABTColor.AntiFlashWhite)
                                .padding(.leading, 20)
                            Text("SET YOUR DEVICE ON A TABLE OR CHAIR")
                                .font(.system(size: 23))
                                .fontWeight(.heavy)
                                .frame(width: 240, height: 120)
                                .foregroundColor(Color.ABTColor.AntiFlashWhite)
                        }.background(
                            RoundedRectangle(
                                cornerRadius: 34)
                            .fill(Color.ABTColor.SteelBlue)
                        )
                        .padding([.top,.leading],20)
                        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                    }
                    
                case .started:
                    if workoutType == .grabTheCircles {
                        ForEach(viewModel.circles) { circle in
                            CircleView(width: circle.size * 2, thickness: 15, color: Color.ABTColor.MikadoYellow)
                                .position(circle.position)
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
                    var userScore = viewModel.scoring()
                    VStack {
                        Text("Score : \(userScore.percentage)%")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                        
                        Text("Rank : \(userScore.letter.rawValue)")
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
                
                VStack {
                    VStack {
                        Text("Score: \(viewModel.score)")
                            .font(.largeTitle)
                            .foregroundColor(Color.ABTColor.AntiFlashWhite)
                        
                        Text("\(updateTimeFormat(remainingTime: viewModel.remainingTime))")
                            .font(.headline)
                            .foregroundColor(Color.ABTColor.AntiFlashWhite)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 17).fill(Color.ABTColor.SteelBlue))
                    .padding()
                }
                .position(x: UIScreen.main.bounds.width / 2, y: 68)
                
                VStack{
                    Button(action: {
                        if viewModel.userState == .waitingToStart {
                            navigationManager.goBackToRoot()
                        } else {
                            viewModel.pauseGame()
                        }
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color.ABTColor.SteelBlue)
                            .font(.system(size: 50))
                    })
                    
                }.padding([.top,.trailing],20)
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topTrailing)
                
                if viewModel.isPause {
                    VStack {
                        VStack{
                            Text("Paused")
                                .font(.system(size: 64))
                                .fontWeight(.bold)
                                .foregroundColor(Color.ABTColor.AntiFlashWhite)
                                .padding(.bottom, 48)
                            HStack{
                                Button {
                                    viewModel.endGame()
                                    navigationManager.goBackToRoot()
                                } label: {
                                    Text("Exit")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.ABTColor.Black)
                                }
                                .frame(width: 200)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.ABTColor.DarkSkyBlue)
                                )
                                
                                Button {
                                    viewModel.resumeGame()
                                } label: {
                                    Text("Continue")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.ABTColor.Black)
                                }
                                .frame(width: 200)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.ABTColor.MikadoYellow)
                                )
                            }
                        }
                        .padding(86)
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.ABTColor.SteelBlue)
                        )
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(CGSize(width: -140.0, height: 0.0))
                    .background(Color.black.opacity(0.75))
                    .onTapGesture {
                        viewModel.resumeGame()
                    }
                }
                    
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
            case .started:
                viewModel.startGame()
            case .gameOver:
                viewModel.endGame()
                break
            }
        }
        .onChange(of: viewModel.isTrackingOk) { prevState, newState in
            if prevState != newState && viewModel.userState == .waitingToStart {
                if newState {
                    viewModel.startCountdown(
                        workoutType: workoutType,
                        userDifficulty: userDifficulty
                    )
                } else {
                    viewModel.countdownText = "Ready"
                    viewModel.countdown = 4
                    viewModel.startCountdownCancellable?.cancel()
                }
            }
            
        }
        .onDisappear {
            viewModel.endGame()
        }
        .navigationBarBackButtonHidden()
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

struct CircleView: View {
    var width: CGFloat
    var thickness: CGFloat
    var color: Color
    
    var body: some View {
        Circle()
            .stroke(lineWidth: thickness)
            .frame(width: width, height: width)
            .foregroundColor(color)
    }
}

#Preview {
    GameView()
}
