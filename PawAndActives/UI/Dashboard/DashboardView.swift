//
//  DashboardView.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    VStack{
                        HStack{
                            Text("GiggleFit")
                                .scaledToFit()
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.ABTColor.CharlestonGreen)
                                .padding(.top, 30)
                                .padding(.leading,25)
                            Spacer()
                               
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
                                .frame(width: 150,height: 66)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.SteelBlue))
                            
                            HStack{
                                Text("G")
                                    .font(.title)
                                    .foregroundColor(Color.ABTColor.SteelBlue)
                                    .scaledToFit()
                                    .frame(width: 90)
                                    .background(Circle().fill(Color.ABTColor.MikadoYellow))
                                Text("0")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color.ABTColor.Linen)
                            }.scaledToFit()
                                .frame(width: 120, height: 65)
                                .padding(.trailing, 30)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.SteelBlue))
                            
                        }.padding(.trailing)
                        HStack(spacing:8){
                            Button {
                                navigationManager.navigate(to: .workoutDetailView(.grabTheCircles))
                            } label: {
                                VStack{
                                    Image.ABTImage.GTCIcon
                                        .resizable()
                                        .frame(width: 330 ,height: 300)
                                        .padding(.bottom, 10)
                                    Text("Grab The Circle")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.ABTColor.CharlestonGreen)
                                } .frame(width: 330,height: 430)
                                    .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.DarkSkyBlue))
                                
                            }.scaledToFit()
                                .padding(.leading, UIScreen.main.bounds.width/180)
                                .frame(maxWidth: UIScreen.main.bounds.width/4.2, maxHeight: UIScreen.main.bounds.width/4, alignment: .leading)
                            Button(action: {
                                navigationManager.navigate(to: .workoutDetailView(.avoidTheBlocks))
                            }
                                   , label: {
                                VStack{
                                    ZStack{
                                        Image.ABTImage.PersonIcon
                                            .resizable()
                                            .frame(width: 250 ,height: 350)
                                            .padding(.leading, 90)
                                        VStack(spacing: 0){
                                            Image.ABTImage.KotakTopIcon
                                                .resizable()
                                                .frame(width: 140, height: 140)
                                                .padding(.trailing, 190)
                                            Image.ABTImage.KotakIcon
                                                .resizable()
                                                .frame(width: 330, height: 190)
                                        }.padding(.top)
                                    }
                                    Text("Avoid The Blocks")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(.top, 12)
                                        .foregroundColor(Color.ABTColor.CharlestonGreen)
                                        .padding(.bottom, 10)
                                }.frame(width: 330,height: 390)
                                    .padding(.bottom, 39)
                                    .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.DarkSkyBlue))
                                
                            })
                            .scaledToFit()
                            .padding(.leading,UIScreen.main.bounds.width/150)
                            .frame(maxWidth: UIScreen.main.bounds.width/4,maxHeight: UIScreen.main.bounds.width/4, alignment: .leading)
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 5){
                                    HStack{
                                        Text("Challenges")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.ABTColor.Linen)
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 20)
                                    HStack{
                                        Text("Finish challenges to gain more gold")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color.ABTColor.Linen)
                                        Spacer()
                                    }
                                    .frame(width:  400)
                                    .padding(.leading, 20)
                                    Button {
                                        navigationManager.navigate(to: .challengeView)
                                    } label: {
                                        Text("Start your Challenge")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundStyle(Color.ABTColor.CharlestonGreen)
                                    }
                                    .frame(width: 450,height: 50)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
                                    .padding(.top, 220)
                                    .padding(.leading, 20)
                                    
                                }
                                .frame(width: 600, height: 430)
                                .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.SteelBlue).frame(width: 630, height: 430))
                                .padding(.leading, 10)
                            }
                            .scaledToFit()
                            .padding(.leading,UIScreen.main.bounds.width/100)
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                        }.padding(.horizontal,12)
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                        
                        HStack{
                            Text("Your Collection")
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
                        VStack{
                            Text("You don’t have any cards")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                            Text("Finish workout or challenges to get golds to draw a card!")
                                .font(.title)
                                .foregroundStyle(.gray)
                        }.padding(.top, 0.06 * geo.size.height)
                        
                    }
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

#Preview {
    NavigationStack {
        DashboardView()
            .environmentObject(NavigationManager())
    }
}
