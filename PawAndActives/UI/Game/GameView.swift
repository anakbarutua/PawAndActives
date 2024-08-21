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
    
    @State var isShowInstruction = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if viewModel.capturedFrame != nil && (viewModel.userState == .gameOver || viewModel.isPause) {
                    
                    Image(uiImage: viewModel.capturedFrame!)
                        .resizable()
                        .scaledToFill()
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
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
                    }
                    
                    VStack{
                        Text("Position your \((viewModel.workoutType == .grabTheCircles) ? "hands" : "head") in the orange circle to start workout")
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
                    
                    
                    if isShowInstruction {
                        
                        VStack {
                            VStack(spacing: 40) {
                                // Title
                                Text("How to Play")
                                    .font(.system(size: 48))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.leading, .top], 40)
                                
                                // Instructions
                                VStack(alignment: .leading, spacing: 40) {
                                    HStack(spacing: 50) {
                                        Image(systemName: "ipad.landscape")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 40)
                                            .foregroundColor(.white)
                                        
                                        Text("SET YOUR DEVICE ON A TABLE OR CHAIR")
                                            .font(.system(size: 32))
                                            .fontWeight(.heavy)
                                            .foregroundColor(Color.ABTColor.White)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    
                                    HStack(spacing: 50) {
                                        Image(systemName: "arrow.left.and.right")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 40)
                                            .foregroundColor(.white)
                                        
                                        VStack(alignment: .leading, spacing: 0) {
                                            Text("SET DISTANCE BETWEEN YOURSELF AND THE IPAD ")
                                                .font(.system(size: 32))
                                                .fontWeight(.heavy)
                                                .foregroundColor(Color.ABTColor.White)
                                            +
                                            Text("~1 METER")
                                                .font(.system(size: 32))
                                                .fontWeight(.heavy)
                                                .foregroundColor(Color.ABTColor.MikadoYellow)
                                        }
                                        .fixedSize(horizontal: false, vertical: true)
                                    }
                                    
                                    HStack(spacing: 50) {
                                        Image(systemName: "figure.arms.open")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .foregroundColor(.white)
                                        
                                        VStack(alignment: .leading, spacing: 0) {
                                            Text("POSITION YOUR \((viewModel.workoutType == .grabTheCircles) ? "HANDS" : "HEAD") IN THE ")
                                                .font(.system(size: 32))
                                                .fontWeight(.heavy)
                                                .foregroundColor(Color.ABTColor.White)
                                            +
                                            Text("ORANGE CIRCLE ")
                                                .font(.system(size: 32))
                                                .fontWeight(.heavy)
                                                .foregroundColor(Color.ABTColor.MikadoYellow)
                                            +
                                            Text("TO START WORKOUT")
                                                .font(.system(size: 32))
                                                .fontWeight(.heavy)
                                                .foregroundColor(Color.ABTColor.White)
                                        }
                                        .fixedSize(horizontal: false, vertical: true)
                                    }
                                }
                                .padding(.horizontal, 40)
                                .padding(.vertical, 40)
                                
                                // Continue Button
                                Button(action: {
                                    isShowInstruction = false
                                }) {
                                    Text("Continue")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, maxHeight: 52)
                                        .background(Color.ABTColor.MikadoYellow)
                                        .cornerRadius(10)
                                }
                                .padding(.horizontal, 50)
                                .padding(.bottom, 40)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.ABTColor.SteelBlue)
                            )
                            .padding(.horizontal, 60)
                            .padding(.vertical, 40)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.75))
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
                    
                    VStack {
                        VStack {
                            Text("Score: \(viewModel.score)")
                                .font(.largeTitle)
                                .foregroundColor(Color.ABTColor.AntiFlashWhite)
                            
                            Text("\(updateTimeFormat(remainingTime: viewModel.remainingTime))")
                                .font(.title2)
                                .foregroundColor(Color.ABTColor.AntiFlashWhite)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 17).fill(Color.ABTColor.SteelBlue))
                        .padding()
                    }
                    .position(x: UIScreen.main.bounds.width / 2, y: 68)
                    
                    
                case .gameOver:
                    let userScore = viewModel.scoring()
                    
                    ZStack {
                        HStack(alignment: .top) {
                            VStack(alignment: .trailing, spacing: 40) {
                                Text("SCORE")
                                    .font(.system(size: 80))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("Rank")
                                    .font(.system(size: 80))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            .padding(.trailing, 86)
                            
                            VStack(alignment: .leading, spacing: 40) {
                                Text("\(userScore.percentage)")
                                    .font(.system(size: 80))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("\(userScore.letter.rawValue)")
                                    .font(.system(size: 96))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .padding(.trailing, 12)
                            

                        }
                        .position(x: (UIScreen.main.bounds.width / 2), y: UIScreen.main.bounds.height / 2)
                        
                        VStack {
                            Text("NEW HIGH \nSCORE!")
                                .font(.system(size: 34))
                                .foregroundColor(.yellow)
                                .bold()
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .offset(x: -115, y: -75)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.75))
                }
                
                if viewModel.userState != .gameOver {
                    VStack{
                        Button(action: {
                            if viewModel.userState == .waitingToStart {
                                navigationManager.goBack()
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
                }
                
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
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
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
        .safeAreaInset(edge: .bottom) {
            if viewModel.userState == .gameOver {
                Button {
                    navigationManager.goBackToRoot()
                } label: {
                    Text("Continue")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.ABTColor.Black)
                        .frame(maxWidth: 3 * UIScreen.main.bounds.width / 4, maxHeight: 52)
                        
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.ABTColor.MikadoYellow)
                .padding(.bottom, 32)
            }
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
