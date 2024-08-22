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
    @State var drawedJoke: Joke?
    
    @AppStorage("totalCoin")
    var totalCoin: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Jokes Collected")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal)
                RiveViewModel(fileName: "white_rive_new").view()
                    .frame(maxHeight: 500)
                    .padding(.bottom)
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
               .buttonStyle(CallToActionPrimaryButtonStyle(isDisabled: totalCoin < 50))
               .disabled(totalCoin < 50)
               .frame(maxWidth: 517)
            }
            DrawJokeOverlay(drawedJoke: $drawedJoke)
        }
    }
    
    func handleDrawJokeButtonPressed() {
        // TODO: Handle JokeError
        let joke = try! JokesGatchaManager.shared.getRandomOne()
        
        drawedJoke = Joke(joke: joke, isFavorite: false)
        JokesCollectionManager.shared.appendJoke(joke: drawedJoke!)
        totalCoin -= 50
    }
}

#Preview {
    NavigationStack {
        JokesGatchaView()
            .environmentObject(NavigationManager())
    }
}
