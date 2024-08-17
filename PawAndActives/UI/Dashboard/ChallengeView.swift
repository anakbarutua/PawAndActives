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
            VStack{
                HStack{
                    Text("Challenges")
                        .font(.largeTitle)
                        .foregroundColor(Color.ABTColor.CharlestonGreen)
                        .fontWeight(.bold)
                        .padding(.trailing, 0.66 * geo.size.width)
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
                                    .frame(width: geo.size.width * 0.04, height: geo.size.height * 0.04)
                                    .background(Circle().fill(Color.ABTColor.MikadoYellow))
                                
                                Text("100")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color.ABTColor.Linen)
                                    .fontWeight(.bold)
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
                HStack{
                    VStack(alignment: .leading,spacing: 10, content: {
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
                                    }
                                    HStack{
                                        Text("Finish Grab the Circles workout in any level for the first time")
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
                            .padding(.top, geo.size.height * 0.01)
                        }
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
                                RoundedRectangle(cornerRadius: 12).fill(Color.ABTColor.DarkSkyBlue))
                        }
                        HStack{
                            if !vm.isNotificationEnabled{
                                if !vm.check{
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
                                    }
                                }
                                else if vm.check{
                                    Button(action: {
                                        vm.checkNotificationStatus()
                                        vm.requestNotificationPermission()
                                        if !vm.isNotificationEnabled {
                                            vm.trigger()
                                        }
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
                                    }
                                    .alert(isPresented: $vm.isAlert){
                                        Alert(
                                            title: Text("Permission Required"),
                                            message: Text("Notification access is required for this feature. Please enable it in settings."),
                                            dismissButton: .default(Text("Open Settings")){
                                                vm.openSetting()
                                            }
                                        )
                                    }
                                    
                                }
                            }
                            else
                            {
                                
                            }
                        }
                        .onAppear {
                            vm.checkNotificationStatus()
                        }
                    })
                }
            }.padding(.top, 20)
                .padding(.leading, 45)
        }
    }
}

#Preview {
    NavigationStack {
        ChallengeView()
            .environmentObject(NavigationManager())
    }
}
