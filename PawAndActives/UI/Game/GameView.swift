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
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if viewModel.isSessionRunning {
                    CameraPreview(viewModel: viewModel)
                } else {
                    Text("Camera not running")
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            viewModel.startCamera()
        }
        .onDisappear {
            viewModel.stopCamera()
        }
    }
}

#Preview {
    GameView()
}
