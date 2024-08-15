//
//  JokesGatchaView.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI
import RiveRuntime

struct JokesGatchaView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State var drawedJoke: String?;
    
    var body: some View {
        ZStack {
            VStack {
                RiveViewModel(fileName: "machine").view()
                    .frame(maxHeight: 500)
                Button(action: handleDrawJokeButtonPressed, label: {
                    HStack {
                        Text("Draw")
                        CoinLogo()
                        Text("50")
                    }
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: 500)
                })
               .buttonStyle(CallToActionPrimaryButtonStyle())
            }
            DrawJokeOverlay(drawedJoke: $drawedJoke)
        }
        .navigationTitle("Jokes Bank")
    }
    
    func handleDrawJokeButtonPressed() {
        // TODO: Handle JokeError
        let joke = try! JokesGatchaManager.shared.getRandomOne()
        
        drawedJoke = joke
    }
}

#Preview {
    NavigationStack {
        JokesGatchaView()
            .environmentObject(NavigationManager())
    }
}
