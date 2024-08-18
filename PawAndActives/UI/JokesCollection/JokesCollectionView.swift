//
//  JokesGatchaView.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI

struct JokesCollectionView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State var selectedJoke: String? = nil
    
//    let data = JokesCollectionManager.shared.fetchJokes()
    let data = [
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.1",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.2",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.3",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.4",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.5",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.6",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.7",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.8",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.9",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.10",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.11",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.12",
        "I'm tired of following my dreams. I'm just going to ask them where they are going and meet up with them later.13",
    ]
    
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
                    Text("Your collection")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                    
                    } label: {
                        Image(systemName: "bookmark")
                            .font(.largeTitle)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.horizontal)
                ScrollView {
                    LazyVGrid(columns: self.columns) {
                        ForEach(data, id: \.self) { joke in
                            Button {
                                selectedJoke = joke
                            } label: {
                                Text("\(joke)")
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
