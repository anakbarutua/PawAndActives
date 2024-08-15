//
//  CallToActionPrimaryButton.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI

struct DrawJokeButton: View {
    var body: some View {
    ZStack() {
        Rectangle()
        .foregroundColor(.clear)
        .frame(width: 517, height: 69)
        .background(Color(red: 1, green: 0.70, blue: 0.26))
        .cornerRadius(14)
        .offset(x: 0, y: 0)
        Text("Draw")
        .font(Font.custom("SF Pro", size: 34).weight(.bold))
        .tracking(0.40)
        .lineSpacing(41)
        .foregroundColor(.black)
        .offset(x: -42, y: 0)
        Text("50")
        .font(Font.custom("SF Pro", size: 32).weight(.bold))
        .foregroundColor(.black)
        .offset(x: 73, y: 2.50)
        ZStack() {
        Ellipse()
          .foregroundColor(.clear)
          .frame(width: 34, height: 34)
          .background(.black)
          .offset(x: 0, y: -0.50)
        Text("G")
          .font(Font.custom("SF Pro", size: 33))
          .foregroundColor(Color(red: 1, green: 0.70, blue: 0.26))
          .offset(x: -1, y: 0)
      }
      .frame(width: 34, height: 39)
      .offset(x: 26.50, y: 3)
    }
    .frame(width: 517, height: 69);
    }
}
