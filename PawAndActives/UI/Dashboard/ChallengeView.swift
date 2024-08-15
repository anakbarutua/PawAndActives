//
//  ChallengeView.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI

struct ChallengeView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var isNotificationEnabled = false
    @StateObject private var vm = DashboardViewModel()
    
    var body: some View {
        GeometryReader { geo in
//            ScrollView{
                VStack{
                    HStack{
                        Text("Challenges")
                            .font(.largeTitle)
                            .foregroundColor(Color.ABTColor.CharlestonGreen)
                            .fontWeight(.bold)
                            .padding(.trailing, 0.66 * geo.size.width)
//                            .padding(.top, 0.03 * geo.size.height)
                        HStack{
                                Text("G")
                                .font(.title)
                                .foregroundColor(Color.ABTColor.SteelBlue)
                                .scaledToFit()
                                .frame(width: 0.06 * geo.size.width)
                                .background(Circle().fill(Color.ABTColor.MikadoYellow))
                                Text("0")
                                .font(.system(size: 32))
                                                        /*.scaledToFit()*/
                        //                                .frame(height: 40)
                                .foregroundColor(Color.ABTColor.Linen)
//                                    .padding(.trailing, 0.0 * geo.size.width)
                                }.scaledToFit()
                                .frame(width: 0.0865 * geo.size.width, height: 0.065 * geo.size.height)
                                .padding(.trailing, 0.03 * geo.size.width)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.SteelBlue))
                    }
                    //                HStack{
                    //                    Spacer()
                    //                    Text("Challenges")
                    //                        .font(.largeTitle)
                    //                        .fontWeight(.bold)
                    //                        .padding(.trailing, geo.size.width * 0.66)
                    //                    HStack{
                    //                        Image("shop")
                    //                            .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.06)
                    //                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.Black))
                    //                            .padding(.trailing, geo.size.width * 0.01)
                    //                        HStack{
                    //                            Text("G")
                    //                                .font(.largeTitle)
                    //                            //                    .background(.blue)
                    //                                .frame(width: geo.size.width * 0.04, height: geo.size.height * 0.04)
                    //                                .background(Circle().fill(Color.ABTColor.Black))
                    //
                    //                            Text("0")
                    //                                .font(.system(size: 32))
                    //                                .foregroundColor(Color.ABTColor.Black)
                    //                            //.padding(.leading, geo.size.width * 0.02)
                    //                        }.frame(width: geo.size.width * 0.08, height: geo.size.height * 0.0534)
                    //                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.Black))
                    //                    }.padding(.leading, geo.size.width * 0.02)
                    //                    Spacer()
                    //                }
                    HStack{
                        VStack(alignment: .leading, spacing: 4, content:{
                            HStack{
                                Text("Newcomer Challenge")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.ABTColor.Linen)
                                    
                                HStack{
                                    Text("G")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.ABTColor.DarkSkyBlue)
                                    //                    .background(.blue)
                                        .frame(width: geo.size.width * 0.04, height: geo.size.height * 0.04)
                                        .background(Circle().fill(Color.ABTColor.MikadoYellow))
                                    
                                    Text("100")
                                        .font(.system(size: 32))
                                        .foregroundColor(Color.ABTColor.Linen)
                                        .fontWeight(.bold)
                                    //.padding(.leading, geo.size.width * 0.02)
                                }.frame(width: geo.size.width * 0.107, height: geo.size.height * 0.0534)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.DarkSkyBlue))
                                    .padding(.leading, geo.size.width * 0.53)
                            }
                            Text("Complete these onboarding challenge and you’ll earn 100 Gold once you’re done")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .foregroundColor(Color.ABTColor.Linen)
                            HStack{
                                VStack{
                                    ProgressView(value: 0.0, label: { Text("Your Progress")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.ABTColor.MikadoYellow)
                                    })
                                    .padding(.top, geo.size.height * 0.036)
                                    .padding(.trailing, geo.size.width * 0.01)
                                    .progressViewStyle(BarProgressStyle(height: 20.0))
                                }
                                VStack{
                                    Text("0/3")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.ABTColor.MikadoYellow)
                                        .padding(.top,20)
                                        .padding(.trailing,20)
                                }
                            }
                        }).padding(.top,geo.size.height * 0.02)
                            .padding(.leading,geo.size.width * 0.01)
                    }.frame(width: geo.size.width
                            * 0.94, height: geo.size.height
                            * 0.25)
                    .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.SteelBlue))
                    //.padding(.leading, geo.size.width * 0.0)
//                    .padding(.top, geo.size.height * 0.01)
                    
                    HStack{
                        VStack(alignment: .leading,spacing: 10, content: {
                            
                            // Button Complete Circle
                            Button(action: {
                                navigationManager.navigate(to: .workoutDetailView(.grabTheCircles))
                            }) {
                                HStack{
                                    VStack{
                                        HStack{
                                            Text("Complete Grab The Circle")
                                                .foregroundStyle(Color.ABTColor.CharlestonGreen)
                                                .fontWeight(.bold)
                                                .font(.title)
                                            Spacer()
                                            Spacer()
//                                            Spacer()
                                        }
                                        HStack{
                                            Text("Finish Grab the Circles workout in any level for the first time")
                                                .foregroundStyle(Color.ABTColor.CharlestonGreen)
                                                .font(.title3)
                                            Spacer()
                                        }/*.padding(.top, 0.00000001 * geo.size.height)*/
                      }/*.navigationTitle("Challenges")*/
                                    
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color.ABTColor.CharlestonGreen)
                                        .background(
                                            Circle()
                                                .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.05)
                                        ).foregroundStyle(Color.ABTColor.MikadoYellow)
                                    
                                }
                                .padding(.horizontal,geo.size.width * 0.05)
                                .frame(maxWidth:geo.size.width * 0.94, maxHeight: geo.size.height * 0.13)
                                .background(
                                    RoundedRectangle(cornerRadius: 12).fill(Color.ABTColor.DarkSkyBlue)
                                )
                                .padding(.top, geo.size.height * 0.01)
                                //.padding(.leading, geo.size.width * 0.0)
                            }
                            
                            // Button Avoid Blocks
                            
                            Button(action: {
                                navigationManager.navigate(to: .workoutDetailView(.avoidTheBlocks))
                            }) {
                                HStack{
                                    VStack{
                                        HStack{
                                            Text("Complete Avoid The Blocks")
                                                .foregroundStyle(Color.ABTColor.CharlestonGreen)
                                                .fontWeight(.bold)
                                                .font(.title)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("Finish Avoid The Blocks workout in any level for the first time")
                                                .foregroundStyle(Color.ABTColor.CharlestonGreen)
                                                .font(.title3)
                                            Spacer()
                                        }
                                    }/*.navigationTitle("Challenges")*/
                                    
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color.ABTColor.CharlestonGreen)
                                        .background(
                                            Circle()
                                                .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.05)
                                        ).foregroundStyle(Color.ABTColor.MikadoYellow)
                                    
                                }
                                .padding(.horizontal,geo.size.width * 0.05)
                                .frame(maxWidth:geo.size.width * 0.94, maxHeight: geo.size.height * 0.13)
                                .background(
                                    RoundedRectangle(cornerRadius: 12).fill(Color.ABTColor.DarkSkyBlue)
                                )
                                // .padding(.leading, geo.size.width * 0.0)
                            }
                            
                            // Button Notification
                            HStack{
                                if !vm.isNotificationEnabled{
                                    Button(action: {
                                        vm.requestNotificationPermission()
                                    }) {
                                        HStack{
                                            VStack{
                                                HStack{
                                                    Text("Turn On Notification")
                                                        .foregroundStyle(Color.ABTColor.CharlestonGreen)
                                                        .fontWeight(.bold)
                                                        .font(.title)
                                                    Spacer()
                                                }
                                                HStack{
                                                    Text("Let us remind you to do your daily challenges")
                                                        .foregroundStyle(Color.ABTColor.CharlestonGreen)
                                                        .font(.title3)
                                                    Spacer()
                                                }
                                            }
                                            
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundStyle(Color.ABTColor.CharlestonGreen)
                                                .background(
                                                    Circle()
                                                        .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.05)
                                                ).foregroundStyle(Color.ABTColor.MikadoYellow)
                                            
                                        }
                                        .padding(.horizontal,geo.size.width * 0.05)
                                        .frame(maxWidth:geo.size.width * 0.94, maxHeight: geo.size.height * 0.13)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12).fill(Color.ABTColor.DarkSkyBlue)
                                        )
                                        // .padding(.leading, geo.size.width * 0.0)
                                    }
                                }
                                else
                                {
                                    
                                }
                            }.onAppear {
                                vm.checkNotificationStatus()
                            }
                            
                            //                        .background(RoundedRectangle (cornerSize: CGSize(width: geo.size.width * 0.8, height: 200)).fill(.gray))
                            //                        Button(action: {  }) {
                            //                            Text("Complete Avoid the Blocks")
                            //                                .multilineTextAlignment(.leading)
                            //                        }.frame(minWidth: 100, maxWidth: 1346, minHeight: 100)
                            //                            .background(RoundedRectangle (cornerSize: CGSize(width: geo.size.width * 0.01, height: 10)).fill(.gray))
                            //                        Button(action: {  }) {
                            //                            Text("Turn on Notification")
                            //                                .multilineTextAlignment(.leading)
                            //                        }.frame(minWidth: 100, maxWidth: 1346, minHeight: 100)
                            //                            .background(RoundedRectangle (cornerSize: CGSize(width: geo.size.width * 0.01, height: 10)).fill(.gray))
                        })
                    }
                }.padding(.top, 20)
                .padding(.leading, 45)
//                .navigationTitle("Challenges")
//                .navigationBarTitleDisplayMode(.inline)
                
//                .toolbar {
//                    
////                    ToolbarItem(placement: .topBarLeading) {
////                        Text("Challenges")
////                            .font(.largeTitle)
////                            .fontWeight(.bold)
////                    }
////                    
////                    ToolbarItem(placement: .topBarTrailing) {
////                        VStack {
////                            Button(action: {
////                                
////                            }, label: {
////                                HStack{
////                                    Image.ABTImage.Shop
////                                        .resizable()
////                                        .frame(width: 44, height: 35)
////                                    Text("Draw")
////                                        .foregroundColor(Color.ABTColor.PrussianBlue)
////                                        .font(.title)
////                                    //                                    .fontWeight(.bold)
////                                }
////                            }).scaledToFit()
////                                .padding(8)
////    //                            .frame(width: sz.sRectangleWidthS * sz.width)
////                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
////                        }
////                        .padding(.bottom, 24)
////                    }
//                    
//                    ToolbarItem(placement: .topBarTrailing) {
//                        VStack {
//                            HStack{
//                                Text("G")
//                                    .font(.largeTitle)
//                                    .foregroundColor(Color.ABTColor.PastelOrange)
//                                    .scaledToFit()
//                                    .frame(width: 102,height: 50)
//                                    .background(Circle().fill(Color.ABTColor.PrussianBlue))
//                                Text("0")
//                                    .font(.system(size: 32))
//                                    .scaledToFit()
//                                    .frame(width: 20, height: 38)
//                                    .foregroundColor(Color.ABTColor.PrussianBlue)
//                                    .padding(.trailing, 20)
//                            }
//                            .scaledToFit()
//                            .frame(width: 150, height: 55)
//                            .padding(.vertical, 2)
//                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.PastelOrange))
//                        }
//                        .padding(.top, 24)
//                    }
//                }
            }
        }
//    }
}

#Preview {
    NavigationStack {
        ChallengeView()
            .environmentObject(NavigationManager())
    }
}
