//
//  DrawJokeOverlay.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI

struct DrawJokeOverlay: View {
    @Binding var drawedJoke: String?
    
    var body: some View {
        ZStack() {
            VStack(spacing: 40) {
                Text("You got a new card !")
                  .font(.system(size: 48))
                  .fontWeight(.bold)
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
                        .frame(maxWidth: 500)
                })
               .buttonStyle(CallToActionPrimaryButtonStyle())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color(red: 0, green: 0, blue: 0).opacity(0.50))
        .opacity(drawedJoke == nil ? 0 : 1)
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.5))
      }
}

