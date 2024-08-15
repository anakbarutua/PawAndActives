//
//  JokesGatchaView.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI

struct JokesGatchaView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State var drawedJoke: String?;
    
    var body: some View {
        ZStack {
            VStack {
                
                //            Image.ABTImage.GTCIcon
                //
                //            Button("Go to Challenge Screen") {
                //                navigationManager.navigate(to: .challengeView)
                //            }
                //            .foregroundStyle(Color.ABTColor.PrussianBlue)
                
//                DrawJokeButton()
                Button(action: handleDrawJokeButtonPressed, label: {
                    Text("Draw 50")
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.bold)
                })
                .background(
                    RoundedRectangle(
                        cornerRadius: 14
                    )
                    .fill(
                        Color.ABTColor.PastelOrange
                    )
                    .frame(width: 517, height: 69)
                )
            }
            DrawJokeOverlay(drawedJoke: $drawedJoke)
                .opacity(drawedJoke == nil ? 0 : 1)
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

struct DrawJokeOverlay: View {
    @Binding var drawedJoke: String?
    
    var body: some View {
        ZStack() {
            VStack(spacing: 40) {
                Text("You got a new card !")
                  .font(Font.custom("SF Pro", size: 48).weight(.bold))
                  .tracking(0.40)
                  .foregroundColor(Color(red: 1, green: 0.70, blue: 0.26))
                ZStack() {
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 517, height: 515)
                    .background(Color(red: 0.99, green: 0.87, blue: 0.53))
                    .cornerRadius(14)
                    Text("\(drawedJoke ?? "")")
                    .font(Font.custom("SF Pro", size: 54).weight(.bold))
                    .foregroundColor(.black)
                    .padding()
                }
                .frame(width: 517, height: 515)
                Button(action: {
                    drawedJoke = nil
                }, label: {
                    Text("Continue")
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.bold)
                })
                .background(
                    RoundedRectangle(
                        cornerRadius: 14
                    )
                    .fill(
                        Color.ABTColor.PastelOrange
                    )
                    .frame(width: 517, height: 69)
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color(red: 0, green: 0, blue: 0).opacity(0.50));
      }
}
