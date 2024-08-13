//
//  DashboardView.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var sz: SizeCount
    
    var body: some View {
        //GeometryReader { geo in
        ScrollView {
            VStack {
//                    HStack{
//                        Text("DAD JOKES")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .frame(width: 190 * sz.width, height: sz.text1Height * sz.height)
//                        Spacer()
//                        Image("shop")
//                            .frame(width: sz.sRectangleWidthS * sz.width, height: sz.sRectangleHeight * sz.height)
//                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color(hex: 4408131)))
//                        HStack{
//                            Text("G")
//                                .font(.largeTitle)
//                                .frame(width: 34 * sz.width, height: 39 * sz.height)
//                                .background(Circle().fill(.black))
//                            Text("0")
//                                .font(.system(size: 32))
//                                .foregroundColor(Color(hex:16759563 ))
//                        }.frame(width: sz.sRectangleWidthL * sz.width, height: sz.sRectangleHeight * sz.height)
//                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color(hex: 4408131)))
//                    }
//                    .frame(width: sz.textFrameW * sz.width, height: sz.sRectangleHeight * sz.height)
                    VStack{
                        Text("Workouts")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.trailing, 1084 * sz.width)
                        HStack(spacing: 15 * sz.width){
                            Button {
                                
                            } label: {
                                VStack{
                                    Image.ABTImage.GTCIcon
                                        .resizable()
                                        .frame(height: 220)
                                        .padding(.bottom, 50)
//                                        .padding(.leading,5)
                                    
                                    Text("Grab The Circle")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.ABTColor.Black)
//                                        .padding(.top, 60)
//                                        .scaledToFit()
                                }
                                
                                    
                            }.scaledToFit()
                                .frame(height: 400)
                                .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.BananaMania))
                            
                            Button(action: {
                                
                            }
                                   , label: {
                                VStack{
                                    Image.ABTImage.ATBIcon
                                        .resizable()
                                        .frame(height: 240)
                                    Spacer()
//                                        .padding(.bottom, 30)
//                                        .padding(.leading,5)
                                    Text("Avoid The Blocks")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.ABTColor.Black)
//                                        .padding(.top, 20)
//                                        .scaledToFit()
                                }
                                   
                            })
                            .scaledToFit()
                            .frame(height: 400)
                            //.frame(width: sz.squareWidth * sz.width, height: sz.squareHeight * sz.height)
                                .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.BananaMania))
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 7){
                                    HStack{
                                        Text("Challenges")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    .frame(width: sz.boxRectangle * sz.width)
                                    //.foregroundStyle(.white)
                                    HStack{
                                        Text("Finish challenges to gain more gold")
                                            .font(.title2)
                                        Spacer()
                                    }
                                    .frame(width: 350 * sz.width)
                                    // .foregroundStyle(.white)
                                    Button {
                                        navigationManager.navigate(to: .challengeView)
                                    } label: {
                                        Text("Start your Challenge")
                                            .font(.title2)
                                            .foregroundStyle(.black)
                                    }.navigationTitle("Dashboard")
                                    .frame(width: sz.boxRectangle * sz.width, height: 42 * sz.height)
                                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
                                        .padding(.top, 200 * sz.height)
                                    
                                }
                                .frame(width: sz.boxWidth * sz.width, height: sz.boxHeight * sz.height)
                                .padding(.trailing, 200 * sz.width)
                            }
                            .scaledToFit()
                            .frame(width: sz.rectangleWidth * sz.width, height: 400)
                                .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.BananaMania))
                                .padding(.leading, 20 * sz.width)
                        }
                        HStack{
                            Text("Your Collection")
                                .font(.title)
                                .fontWeight(.bold)
                            //                        Text("See More")
                            //                            .font(.title3)
                            Spacer()
                            Button(action: {
                                
                            }, label: {
                                Text("See More")
                                    .foregroundColor(Color.black)
//                                    .fontWeight(.bold)
                            })
                        }
                        .padding(.top, 12 * sz.height)
                        .frame(width: sz.textFrameW, height: sz.textFrameH)
                        
                        VStack{
                            Text("You don’t have any cards")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                            Text("Finish workout or challenges to get golds to draw a card!")
                                .font(.title)
                                .foregroundStyle(.gray)
                        }.padding(.top, 101 * sz.height)
                        
                    }
                }
                .frame(width: sz.frameWidth * sz.width)
//                .padding(.bottom, 161 * sz.height)
            .navigationTitle("DAD JOKES")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    VStack {
                        Button(action: {
                            
                        }, label: {
                            HStack{
                                Image.ABTImage.Shop
                                    .resizable()
                                    .frame(width: 44, height: 35)
                                Text("Draw")
                                    .foregroundColor(Color.ABTColor.PrussianBlue)
                                    .font(.title)
                                //                                    .fontWeight(.bold)
                            }
                        }).scaledToFit()
                            .padding(8)
//                            .frame(width: sz.sRectangleWidthS * sz.width)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
                    }
                    .padding(.bottom, 24)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    VStack {
                        HStack{
                            Text("G")
                                .font(.largeTitle)
                                .foregroundColor(Color.ABTColor.PastelOrange)
                                .scaledToFit()
                                .frame(width: 102,height: 50)
                                .background(Circle().fill(Color.ABTColor.PrussianBlue))
                            Text("0")
                                .font(.system(size: 32))
                                .scaledToFit()
                                .frame(width: 20, height: 38)
                                .foregroundColor(Color.ABTColor.PrussianBlue)
                                .padding(.trailing, 20)
                        }
                        .scaledToFit()
                        .frame(width: 150, height: 55)
                        .padding(.vertical, 2)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
                    }
                    .padding(.bottom, 24)
                }
            }
            
        }
            
            
      //  }
    }
    
//    var body: some View {
//        VStack {
//            
//            Image.ABTImage.GTCIcon
//            
//            Button("Go to Challenge Screen") {
//                navigationManager.navigate(to: .challengeView)
//            }
//            .foregroundStyle(Color.ABTColor.PrussianBlue)
//        }
//        .navigationTitle("Dashboard")
//    }
}

#Preview {
    NavigationStack {
        DashboardView(sz: SizeCount())
            .environmentObject(NavigationManager())
    }
}
