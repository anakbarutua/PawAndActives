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
        GridItem(.fixed(270)),
        GridItem(.fixed(270)),
        GridItem(.fixed(270)),
        GridItem(.fixed(270)),
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
                                    Text("\(joke.joke.Joke)")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .padding()
                                        .frame(width: 270, height: 300)
                                        .background(Color.orange)
                                        .foregroundColor(Color.black)
                                        .cornerRadius(25)
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
