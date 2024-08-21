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
                                    .frame(width: 0.0865 * geo.size.width, height: 0.065 * geo.size.height)
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
                                        .frame(width: 0.2 * geo.size.width ,height: 0.25 * geo.size.height)
                                        .padding(.bottom, 0.01 * geo.size.height)
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
                                            .frame(width: 0.13 * geo.size.width ,height: 0.285 * geo.size.height)
                                            .padding(.leading, 0.065 * geo.size.width)
                                            .padding(.top, 0.02 * geo.size.height)
                                        VStack(spacing: 0){
                                            Image.ABTImage.KotakTopIcon
                                                .resizable()
                                                .frame(width: 0.099 * geo.size.width, height: 0.154 * geo.size.height)
                                                .padding(.trailing, 0.1 * geo.size.width)
                                            Image.ABTImage.KotakIcon
                                                .resizable()
                                                .frame(width: 0.2 * geo.size.width, height: 0.15 * geo.size.height)
                                        }
                                    }.padding(.bottom, 0.001 * geo.size.height)
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
