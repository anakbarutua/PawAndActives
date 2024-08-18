//
//  JokeDetailOverlay.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 19/08/24.
//

import SwiftUI

struct JokeDetailOverlay: View {
    @Binding var selectedJoke: String?
    
    var body: some View {
        ZStack() {
            VStack(spacing: 40) {
                ZStack() {
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 517, height: 515)
                    .background(Color(red: 0.99, green: 0.87, blue: 0.53))
                    .cornerRadius(14)
                    Text("\(selectedJoke ?? "")")
                    .font(Font.custom("SF Pro", size: 54).weight(.bold))
                    .foregroundColor(.black)
                    .padding()
                }
                .frame(width: 517, height: 515)
                
                Button(action: {
                    selectedJoke = nil
                }, label: {
                    Text("Dismiss")
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
        .opacity(selectedJoke == nil ? 0 : 1)
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.5))
      }
}

