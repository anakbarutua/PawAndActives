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
    
    var workoutType: WorkoutType = .grabTheCircles
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if viewModel.isSessionRunning {
                    CameraPreview(viewModel: viewModel)
                    
                    ForEach(viewModel.handPoints, id: \.self) { handPoint in
                        Circle()
                            .fill(Color.red)
                            .frame(width: 10, height: 10)
                            .position(handPoint)
                    }
                } else {
                    Text("Camera not running")
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            viewModel.startCamera(workoutType: workoutType)
        }
        .onDisappear {
            viewModel.stopCamera()
        }
    }
}

#Preview {
    GameView()
}
