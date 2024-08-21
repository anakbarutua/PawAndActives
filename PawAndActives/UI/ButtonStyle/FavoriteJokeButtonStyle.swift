//
//  FavoriteJokeButtonStyle.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 21/08/24.
//

import SwiftUI

struct FavoriteJokeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.white)
            .foregroundColor(Color.ABTColor.PastelOrange)
            .clipShape(Circle())
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
