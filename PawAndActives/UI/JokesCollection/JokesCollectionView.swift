//
//  JokesGatchaView.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI

struct JokesCollectionView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State var selectedJoke: Joke? = nil
    
    let data = JokesCollectionManager.shared.fetchJokes()
//    let data = [
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.1",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.2",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.3",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.4",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.5",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.6",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.7",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.8",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.9",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.10",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.11",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.12",
//        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.13",
//    ].map { Joke(joke: JokeDto(Joke: $0), isFavorite: false) }
    
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
                    Text("Jokes Collected")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        navigationManager.navigate(to: .jokesSavedView)
                    } label: {
                        Image(systemName: "bookmark")
                            .font(.largeTitle)
                            .foregroundStyle(.black)
                    }
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
                                    JokeCard(category: joke.joke.Category, joke: joke.joke.Joke)
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
        JokesCollectionView()
            .environmentObject(NavigationManager())
    }
}
