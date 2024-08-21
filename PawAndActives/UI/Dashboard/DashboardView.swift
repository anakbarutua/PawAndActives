//
//  DashboardView.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    
    let data = Array(JokesCollectionManager.shared.fetchJokes().prefix(5))
    
    var columns: [GridItem] = [
        GridItem(.fixed(225)),
        GridItem(.fixed(225)),
        GridItem(.fixed(225)),
        GridItem(.fixed(225)),
        GridItem(.fixed(225)),
    ]
    
    var body: some View {
        GeometryReader { geo in
        ScrollView {
            VStack {
                    VStack{
                        HStack{
                            Text("GiggleFit")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.ABTColor.CharlestonGreen)
                                .padding(.trailing, 0.61 * geo.size.width)
                                .padding(.top, 0.03 * geo.size.height)
                            Button(action: {
                                navigationManager.navigate(to: .jokesGatchaView)
                            }, label: {
                                                        
                                HStack{
                                                            
                                    Image.ABTImage.Shop
                                        .resizable()
                                        .frame(width: 44, height: 35)
                                        Text("Draw")
                                        .foregroundColor(Color.ABTColor.Linen)
                                        .font(.title)
                                        .fontWeight(.bold)
                                                        }
                            }).scaledToFit()
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.SteelBlue))
                            
                            HStack{
                                    Text("G")
                                    .font(.title)
                                    .foregroundColor(Color.ABTColor.SteelBlue)
                                    .scaledToFit()
                                    .frame(width: 0.06 * geo.size.width)
                                    .background(Circle().fill(Color.ABTColor.MikadoYellow))
                                    Text("0")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color.ABTColor.Linen)
                                    }.scaledToFit()
                                    .frame(width: 0.0865 * geo.size.width, height: 0.054 * geo.size.height)
                                    .padding(.trailing, 0.03 * geo.size.width)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.SteelBlue))
                            
                        }
                        HStack{
                            Button {
                                navigationManager.navigate(to: .workoutDetailView(.grabTheCircles))
                            } label: {
                                VStack{
                                    Image.ABTImage.GTCIcon
                                        .resizable()
                                        .frame(width: 0.21 * geo.size.width ,height: 0.275 * geo.size.height)
                                    Text("Grab The Circle")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.ABTColor.CharlestonGreen)
                                }
                                
                                    
                            }.scaledToFit()
                                .frame(height: 0.4 * geo.size.height)
                                .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.DarkSkyBlue))
                            Button(action: {
                                navigationManager.navigate(to: .workoutDetailView(.avoidTheBlocks))
                            }
                                   , label: {
                                VStack{
                                    ZStack{
                                        Image.ABTImage.PersonIcon
                                            .resizable()
                                            .padding(.top, 0.01 * geo.size.height)
                                            .frame(width: 0.13 * geo.size.width ,height: 0.27 * geo.size.height)
                                            .padding(.leading, 0.08 * geo.size.width)
                                            .padding(.top, 0.04 * geo.size.height)
                                        VStack(spacing: 0){
                                            Image.ABTImage.komponent
                                                .resizable()
                                                .frame(width: 0.2 * geo.size.width, height: 0.31 * geo.size.height)
                                        }
                                    }
                                    Text("Avoid The Blocks")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.ABTColor.CharlestonGreen)
                                        .padding(.bottom, 0.01 * geo.size.height)
                                }.padding(.bottom, 0.029 * geo.size.height)
                                   
                            })
                            .scaledToFit()
                            .frame(width: 0.199 * geo.size.width,height: 0.4 * geo.size.height)
                                .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.DarkSkyBlue))
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 5){
                                    HStack{
                                        Text("Challenges")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.ABTColor.Linen)
                                            
                                        Spacer()
                                    }
                                    .padding(.leading, 0.01 * geo.size.width)
                                    HStack{
                                        Text("Finish challenges to gain more gold")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color.ABTColor.Linen)
                                        Spacer()
                                    }
                                    .frame(width:  0.3 * geo.size.width)
                                    .padding(.leading, 0.01 * geo.size.width)
                                    Button {
                                        navigationManager.navigate(to: .challengeView)
                                    } label: {
                                        Text("Start your Challenge")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundStyle(Color.ABTColor.CharlestonGreen)
                                    }
                                        .frame(width: 0.3 * geo.size.width
                                               , height: 0.045 * geo.size.height)
                                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
                                        .padding(.top, 0.17 * geo.size.height)
                                        .padding(.leading, 0.01 * geo.size.width)
                                    
                                }
                                .padding(.trailing, 0.1 * geo.size.width)
                            }
                            .scaledToFit()
                            .frame(height: 0.4 * geo.size.height)
                                .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.SteelBlue))
                                .padding(.leading, 0.01 * geo.size.width)
                        }
                        HStack{
                            Text("Jokes Collected")
                                .font(.title)
                                .foregroundColor(Color.ABTColor.CharlestonGreen)
                                .fontWeight(.bold)
                                .padding(.leading, 0.023 * geo.size.width)
                            Spacer()
                            
                            Button(action: {
                                navigationManager.navigate(to: .jokesCollectionView)
                            }, label: {
                                Text("See More")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.ABTColor.DarkSkyBlue)
                                    .padding(.trailing, 0.025 * geo.size.width)
                            })
                        }
                        .padding(.top, 0.02 * geo.size.height)
                        if (data.isEmpty) {
                            VStack{
                                Text("You don’t have any cards")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.gray)
                                Text("Finish workout or challenges to get golds to draw a card!")
                                    .font(.title)
                                    .foregroundStyle(.gray)
                            }.padding(.top, 0.06 * geo.size.height)
                        } else {
                            ScrollView {
                                LazyVGrid(columns: self.columns) {
                                    ForEach(data, id: \.self) { joke in
                                        Button {
                                        } label: {
                                            JokeCard(category: joke.joke.Category, joke: joke.joke.Joke)
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
            
        }
    }
    }
}

#Preview {
    NavigationStack {
        DashboardView()
            .environmentObject(NavigationManager())
    }
}
