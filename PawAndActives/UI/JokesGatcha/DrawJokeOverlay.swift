//
//  DrawJokeOverlay.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI

struct DrawJokeOverlay: View {
    @Binding var drawedJoke: Joke?
    
    var body: some View {
        ZStack() {
            VStack(spacing: 40) {
                Text("You got a new card !")
                  .font(.system(size: 48))
                  .fontWeight(.bold)
                  .tracking(0.40)
                  .foregroundColor(Color(red: 1, green: 0.70, blue: 0.26))
                ZStack(alignment: .top) {
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 517, height: 515)
                    .background(
                        ZStack {
                            LinearGradient(gradient: Gradient(colors: [Color(red: 0.36, green: 0.73, blue: 0.87), Color(red: 0.28, green: 0.58, blue: 0.69)]), startPoint: .top, endPoint: .bottom)
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
                                if (drawedJoke == nil){
                                    return
                                }
                                JokesCollectionManager.shared.toggleJokeIsFavorite(joke: drawedJoke!)
                            }, label: {
                                Image(systemName: (drawedJoke?.isFavorite ?? false) ? "bookmark.fill" : "bookmark")
                                    .font(.title)
                            })
                            .buttonStyle(FavoriteJokeButtonStyle())
                        }
                        .padding()
                        GeometryReader { geometry in
                            ScrollView {
                                Text("\(drawedJoke?.joke.Joke ?? "")")
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
                    drawedJoke = nil
                }, label: {
                    Text("Continue")
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: 500)
                })
               .buttonStyle(CallToActionPrimaryButtonStyle())
               .frame(maxWidth: 517)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color(red: 0, green: 0, blue: 0).opacity(0.50))
        .opacity(drawedJoke == nil ? 0 : 1)
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.5))
      }
}

