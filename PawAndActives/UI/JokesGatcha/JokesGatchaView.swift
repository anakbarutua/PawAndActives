//
//  JokesGatchaView.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI

struct JokesGatchaView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        ZStack {
            VStack {
                
                //            Image.ABTImage.GTCIcon
                //
                //            Button("Go to Challenge Screen") {
                //                navigationManager.navigate(to: .challengeView)
                //            }
                //            .foregroundStyle(Color.ABTColor.PrussianBlue)
                
                DrawJokeButton()
            }
        }
        .navigationTitle("Jokes Bank")
    }
    
    func drawJoke() -> String {
        let joke = JokesGatchaManager.shared.getRandomOne()
    }
}

#Preview {
    NavigationStack {
        JokesGatchaView()
            .environmentObject(NavigationManager())
    }
}

struct DrawJokeOverlay: View {
    
    var body: some View {
        ZStack() {
          Text("You got a new card !")
            .font(Font.custom("SF Pro", size: 48).weight(.bold))
            .tracking(0.40)
            .lineSpacing(41)
            .foregroundColor(Color(red: 1, green: 0.70, blue: 0.26))
            .offset(x: 0, y: -310.50)
          ZStack() {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 517, height: 515)
              .background(Color(red: 0.99, green: 0.87, blue: 0.53))
              .cornerRadius(14)
              .offset(x: 0, y: 0)
            Text("Kentang, kentang apa yang lucu?\n\nkentang kintung kentang kintung")
              .font(Font.custom("SF Pro", size: 54).weight(.bold))
              .tracking(0.40)
              .lineSpacing(63)
              .foregroundColor(.black)
              .offset(x: 5.50, y: 14)
          }
          .frame(width: 517, height: 515)
          .offset(x: 0.50, y: -5.50)
          ZStack() {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 517, height: 69)
              .background(Color(red: 1, green: 0.70, blue: 0.26))
              .cornerRadius(14)
              .offset(x: 0, y: 0)
            Text("Continue")
              .font(Font.custom("SF Pro", size: 34).weight(.bold))
              .tracking(0.40)
              .lineSpacing(41)
              .foregroundColor(.black)
              .offset(x: 0, y: 0)
          }
          .frame(width: 517, height: 69)
          .offset(x: 0.50, y: 306.50)
        }
        .frame(width: 1210, height: 834)
        .background(Color(red: 0, green: 0, blue: 0).opacity(0.50));
      }
}
