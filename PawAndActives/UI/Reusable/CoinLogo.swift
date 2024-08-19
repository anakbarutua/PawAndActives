//
//  CoinLogo.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI

struct CoinLogo: View {
  var body: some View {
    ZStack() {
      Ellipse()
        .foregroundColor(.clear)
        .frame(width: 34, height: 34)
        .background(.black)
        .clipShape(Circle())
        .offset(x: 0, y: -0.50)
      Text("G")
        .font(Font.custom("SF Pro", size: 33))
        .foregroundColor(Color(red: 1, green: 0.70, blue: 0.26))
        .offset(x: -1, y: 0)
    }
    .frame(width: 34, height: 39);
  }
}
