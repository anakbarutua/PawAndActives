//
//  JokeCard.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 21/08/24.
//

import SwiftUI

struct JokeCard: View {
    let category: String
    let joke: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 225, height: 300)
                .background(
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.ABTColor.BlueJeans, Color.ABTColor.SteelBlue]), startPoint: .top, endPoint: .bottom)
                        Image("card-bg")
                            .resizable()
                            .scaledToFill()
                    }
                )
                .cornerRadius(25)
            VStack(alignment: .leading) {
                Text("\(category)")
                    .font(.system( size: 24))
                    .fontWeight(.bold)
                    .tracking(0.38)
                    .lineSpacing(34)
                    .lineLimit(1)
                    .foregroundColor(Color.ABTColor.MikadoYellow)
                    .padding(.top)
                    .padding(.horizontal)
                Text("\(joke)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(Color.white)
                    .cornerRadius(25)
                Spacer()
            }
        }
        .frame(width: 225, height: 300)
    }
}
