//
//  JokesSaved.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 19/08/24.
//

import SwiftUI

struct JokesSavedView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State var selectedJoke: Joke? = nil
    
    let data = JokesCollectionManager.shared.fetchJokes().filter { return $0.isFavorite }
    
    var columns: [GridItem] = [
        GridItem(.fixed(225)),
        GridItem(.fixed(225)),
        GridItem(.fixed(225)),
        GridItem(.fixed(225)),
        GridItem(.fixed(225)),
    ]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Saved")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal)
                if (data.isEmpty) {
                    VStack {
                        Spacer()
                        Text("You don’t have any cards")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Finish workout or challenges to get golds to draw a card!")
                            .font(.largeTitle)
                        Spacer()
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: self.columns) {
                            ForEach(data, id: \.self) { joke in
                                Button {
                                    selectedJoke = joke
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 225, height: 300)
                                            .background(
                                                ZStack {
                                                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.36, green: 0.73, blue: 0.87), Color(red: 0.28, green: 0.58, blue: 0.69)]), startPoint: .top, endPoint: .bottom)
                                                    Image("card-bg")
                                                        .resizable()
                                                        .scaledToFill()
                                                }
                                            )
                                            .cornerRadius(25)
                                        VStack(alignment: .leading) {
                                            Text("\(joke.joke.Category)")
                                                .font(.system( size: 30))
                                                .fontWeight(.heavy)
                                                .tracking(0.38)
                                                .lineSpacing(34)
                                                .lineLimit(1)
                                                .foregroundColor(Color.ABTColor.MikadoYellow)
                                                .padding(.top)
                                                .padding(.horizontal)
                                            Text("\(joke.joke.Joke)")
                                                .font(.title)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                .padding()
//                                                        .background(
//                                                            ZStack {
//                                                                LinearGradient(gradient: Gradient(colors: [Color(red: 0.36, green: 0.73, blue: 0.87), Color(red: 0.28, green: 0.58, blue: 0.69)]), startPoint: .top, endPoint: .bottom)
//                                                                Image("card-bg")
//                                                                    .resizable()
//                                                                    .scaledToFill()
//                                                            }
//                                                        )
                                                .foregroundColor(Color.white)
                                                .cornerRadius(25)
                                            Spacer()
                                        }
                                    }
                                    .frame(width: 225, height: 300)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            JokeDetailOverlay(selectedJoke: $selectedJoke)
        }
    }
}

#Preview {
    NavigationStack {
        JokesSavedView()
            .environmentObject(NavigationManager())
    }
}
