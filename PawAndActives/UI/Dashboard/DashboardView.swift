//
//  DashboardView.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var navigationManager: NavigationManager
//    @ObservedObject var sz: SizeCount
    
    var body: some View {
        GeometryReader { geo in
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
                        HStack{
                            Text("Workouts")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.trailing, 0.61 * geo.size.width)
                                .padding(.top, 0.03 * geo.size.height)
//                            Spacer()
                            Button(action: {
                                
                            }, label: {
                                                        
                                HStack{
                                                            
                                    Image.ABTImage.Shop
                                        .resizable()
                                        .frame(width: 44, height: 35)
                                        Text("Draw")
                                        .foregroundColor(Color.ABTColor.PrussianBlue)
                                        .font(.title)
                                        .fontWeight(.bold)
                                                        }
                            }).scaledToFit()
                            .padding(8)
                            //                            .frame(width: sz.sRectangleWidthS * sz.width)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
                            
                            HStack{
                                    Text("G")
                                    .font(.title)
                                    .foregroundColor(Color.ABTColor.PastelOrange)
                                    .scaledToFit()
                                    .frame(width: 0.06 * geo.size.width)
                                    .background(Circle().fill(Color.ABTColor.PrussianBlue))
                                    Text("0")
                                    .font(.system(size: 32))
                                                            /*.scaledToFit()*/
                            //                                .frame(height: 40)
                                    .foregroundColor(Color.ABTColor.PrussianBlue)
//                                    .padding(.trailing, 0.0 * geo.size.width)
                                    }.scaledToFit()
                                    .frame(width: 0.0865 * geo.size.width, height: 0.065 * geo.size.height)
                                    .padding(.trailing, 0.03 * geo.size.width)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
                            
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
//                                        .padding(.leading,0.01 * geo.size.width)
                                    
                                    Text("Grab The Circle")
                                        .font(.title)
                                        .foregroundColor(Color.ABTColor.Black)
//                                        .padding(.top, 60)
//                                        .scaledToFit()
                                }
                                
                                    
                            }.scaledToFit()
                                .frame(height: 0.4 * geo.size.height)
                                .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.BananaMania))
//                                .padding(.leading, 0.0 * geo.size.width)
                            
                            Button(action: {
                                navigationManager.navigate(to: .workoutDetailView(.avoidTheBlocks))
                            }
                                   , label: {
                                VStack{
                                    Image.ABTImage.ATBIcon
                                        .resizable()
                                        .frame(width: 0.2 * geo.size.width ,height: 0.26 * geo.size.height)
//                                        .padding(.bottom, 0.01 * geo.size.width)
//                                        .padding(.leading,5)
                                    Text("Avoid The Blocks")
                                        .font(.title)
                                        .foregroundColor(Color.ABTColor.Black)
//                                        .padding(.top, 20)
//                                        .scaledToFit()
                                }
                                   
                            })
                            .scaledToFit()
                            .frame(height: 0.4 * geo.size.height)
                            //.frame(width: sz.squareWidth * sz.width, height: sz.squareHeight * sz.height)
                                .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.BananaMania))
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 5){
                                    HStack{
                                        Text("Challenges")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            
                                        Spacer()
                                    }
//                                    .frame(width:130)
                                    //.foregroundStyle(.white)
                                    .padding(.leading, 0.01 * geo.size.width)
                                    HStack{
                                        Text("Finish challenges to gain more gold")
                                            .font(.title2)
                                        Spacer()
                                    }
                                    .frame(width:  0.26 * geo.size.width)
                                    .padding(.leading, 0.01 * geo.size.width)
                                    // .foregroundStyle(.white)
                                    Button {
                                        navigationManager.navigate(to: .challengeView)
                                    } label: {
                                        Text("Start your Challenge")
                                            .font(.title2)
                                            .foregroundStyle(.black)
                                    }/*.navigationTitle("Dashboard")*/
                                        .frame(width: 0.3 * geo.size.width
                                               , height: 0.045 * geo.size.height)
                                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
                                        .padding(.top, 0.17 * geo.size.height)
                                        .padding(.leading, 0.01 * geo.size.width)
                                    
                                }
//                                .frame(width: 0.35 * geo.size.width, height: 0.4 * geo.size.height)
                                .padding(.trailing, 0.16 * geo.size.width)
                            }
                            .scaledToFit()
                            .frame(height: 0.4 * geo.size.height)
                                .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.BananaMania))
                                .padding(.leading, 0.01 * geo.size.width)
                        }
                        HStack{
                            Text("Your Collection")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading, 0.023 * geo.size.width)
                                
                            //                        Text("See More")
                            //                            .font(.title3)
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Text("See More")
                                    .foregroundColor(Color.black)
                                    .padding(.trailing, 0.025 * geo.size.width)
//                                    .fontWeight(.bold)
                            })
                        }
                        .padding(.top, 0.02 * geo.size.height)
//                        .frame(width: 300, height: 30)
                        
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
//                .frame(width: 300)
//                .padding(.bottom, 161 * sz.height)
//            .navigationTitle("DAD JOKES")
//            .navigationBarTitleDisplayMode(.inline)
            
//            .toolbar {
//                
//                ToolbarItem(placement: .topBarTrailing) {
//                    VStack {
//                        Button(action: {
//                            
//                        }, label: {
//                            HStack{
//                                Image.ABTImage.Shop
//                                    .resizable()
//                                    .frame(width: 44, height: 35)
//                                Text("Draw")
//                                    .foregroundColor(Color.ABTColor.PrussianBlue)
//                                    .font(.title)
//                                //                                    .fontWeight(.bold)
//                            }
//                        }).scaledToFit()
//                            .padding(8)
////                            .frame(width: sz.sRectangleWidthS * sz.width)
//                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
//                    }
//                    .padding(.bottom, 24)
//                }
//                
//                ToolbarItem(placement: .topBarTrailing) {
//                    VStack {
//                        HStack{
//                            Text("G")
//                                .font(.title)
//                                .foregroundColor(Color.ABTColor.PastelOrange)
//                                .scaledToFit()
//                                .frame(width: 0.079 * geo.size.width)
//                                .background(Circle().fill(Color.ABTColor.PrussianBlue))
//                            Text("0")
//                                .font(.system(size: 32))
//                                /*.scaledToFit()*/
////                                .frame(height: 40)
//                                .foregroundColor(Color.ABTColor.PrussianBlue)
////                                .padding(.leading, 0.01 * geo.size.width)
//                        }
//                        .scaledToFit()
//                        .frame(width: 0.1 * geo.size.width, height: 0.08 * geo.size.height)
//                        .padding(.trailing, 0.03 * geo.size.width)
//                        
//                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
//                    }
////                    .padding(.trailing, 16)
//                    .padding(.bottom, 24)
//                }
//                
//            }
            
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
    }
}

#Preview {
    NavigationStack {
        DashboardView()
            .environmentObject(NavigationManager())
    }
}
