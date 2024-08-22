//
//  CoinLogo.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI

struct CoinLogo: View {
  var body: some View {
      Text("G")
      .font(.title)
      .foregroundColor(Color.ABTColor.SteelBlue)
      .scaledToFit()
      .frame(width: 48, alignment: .center)
      .background(Circle().fill(Color.ABTColor.MikadoYellow))
  }
}

#Preview {
    CoinLogo()
}
