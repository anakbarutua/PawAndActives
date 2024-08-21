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
        JokesSavedView()
            .environmentObject(NavigationManager())
    }
}
