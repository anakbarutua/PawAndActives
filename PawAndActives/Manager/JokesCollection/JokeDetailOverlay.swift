//
//  JokeDetailOverlay.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 19/08/24.
//

import SwiftUI

struct JokeDetailOverlay
: View {
    @Binding var selectedJoke: Joke?
    
    var body: some View {
        ZStack() {
            VStack(spacing: 40) {
                ZStack(alignment: .top) {
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 517, height: 515)
                    .background(
                        ZStack {
                            LinearGradient(gradient: Gradient(colors: [Color.ABTColor.BlueJeans, Color.ABTColor.SteelBlue]), startPoint: .top, endPoint: .bottom)
                            Image("card-bg")
                                .resizable()
                                .scaledToFill()
                        }
                    )
                    .cornerRadius(14)
                    VStack {
                        HStack {
                            Text("Joke")
                                .font(.system(size: 28))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            Button(action: {
                                if (selectedJoke == nil){
                                    return
                                }
                                JokesCollectionManager.shared.toggleJokeIsFavorite(joke: selectedJoke!)
                            }, label: {
                                Image(systemName: (selectedJoke?.isFavorite ?? false) ? "bookmark.fill" : "bookmark")
                                    .font(.title)
                            })
                            .buttonStyle(FavoriteJokeButtonStyle())
                        }
                        .padding()
                        GeometryReader { geometry in
                            ScrollView {
                                Text("\(selectedJoke?.joke.Joke ?? "")")
                                    .font(.system(size: 50))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .scrollTargetLayout()
//                                    // Make the scroll view full-width
//                                    .frame(width: geometry.size.width)
//
//                                    // Set the content’s min height to the parent
//                                    .frame(minHeight: geometry.size.height)
                            }
                            .scrollTargetBehavior(.viewAligned)
                            .animation(nil)
                        }
                    }
                    .padding()
                    
                }
                .frame(width: 517, height: 515)
                
                Button(action: {
                    selectedJoke = nil
                }, label: {
                    Text("Dismiss")
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: 500)
                })
                .buttonStyle(CallToActionPrimaryButtonStyle(isDisabled: false))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color(red: 0, green: 0, blue: 0).opacity(0.50))
        .opacity(selectedJoke == nil ? 0 : 1)
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.5))
      }
}

