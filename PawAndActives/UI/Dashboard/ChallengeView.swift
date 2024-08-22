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
    @StateObject private var vm = DashboardViewModel(repoManager: .shared)
    
    @AppStorage("totalCoin")
    var totalCoin: Int = 0
    
//    @AppStorage("isFirstChallenge")
//    var isFirstChallenge: Bool = true
    
    @AppStorage("totalChallenge")
    var totalChallenge = 2
    
    @State var challengeProgress = 0.0
    
    @AppStorage("isCoinClaimed")
    var isCoinClaimed = false
    
    @State var challengeDone = 0
    
    @State var thereIsGTC = false
    @State var thereIsATB = false
    
    var body: some View {
        GeometryReader { geo in
            VStack{
                HStack{
                    Text("Challenges")
                        .font(.largeTitle)
                        .foregroundColor(Color.ABTColor.CharlestonGreen)
                        .fontWeight(.bold)
                        .padding(.trailing, 0.66 * geo.size.width)
                    
                    Spacer()
                    
                    HStack{
                        CoinLogo()
                        Text("\(totalCoin)")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.ABTColor.Linen)
                    }
                    .scaledToFit()
                    .padding(.horizontal, 18)
                    .padding(.vertical, 8)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.SteelBlue))
                }
                .padding(.trailing, 18)
                
                
                if challengeProgress == 1.0 {
                    VStack {
                        Text("You have completed the daily challenges")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Comeback tomorrow for your next challenges")
                            .font(.title)
                            .fontWeight(.regular)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                } else {
                        HStack{
                            VStack(alignment: .leading, spacing: 4, content:{
                                HStack{
                                    Text("Challenge")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.ABTColor.Linen)
                                    
                                    Spacer()
                                    
                                    HStack{
                                        Text("G")
                                        .font(.title)
                                        .foregroundColor(Color.ABTColor.DarkSkyBlue)
                                        .scaledToFit()
                                        .frame(width: 48, alignment: .center)
                                        .background(Circle().fill(Color.ABTColor.MikadoYellow))
                                        
                                        Text("50")
                                            .font(.system(size: 32))
                                            .foregroundColor(Color.ABTColor.Linen)
                                    }
                                    .scaledToFit()
                                    .padding(.horizontal, 18)
                                    .padding(.vertical, 8)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.SteelBlue))
                                }
                                
                                Text("Complete these onboarding challenge and you’ll earn 50 Gold once you’re done")
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.ABTColor.Linen)
                                HStack{
                                    VStack{
                                        ProgressView(value: challengeProgress, label: { Text("Your Progress")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.ABTColor.MikadoYellow)
                                        })
                                        .padding(.top, geo.size.height * 0.036)
                                        .padding(.trailing, geo.size.width * 0.01)
                                        .progressViewStyle(BarProgressStyle(height: 20.0))
                                    }
                                    VStack{
                                        Text("\(challengeDone)/\(totalChallenge)")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.ABTColor.MikadoYellow)
                                            .padding(.top,20)
                                            .padding(.trailing,20)
                                    }
                                }
                            })
                            .padding(.top,geo.size.height * 0.02)
                            .padding(.leading,geo.size.width * 0.01)
                        }
                        .frame(width: geo.size.width * 0.94, height: geo.size.height * 0.25)
                        .background(RoundedRectangle(cornerRadius: 14.0).fill(Color.ABTColor.SteelBlue))
                        HStack{
                            VStack(alignment: .leading,spacing: 10) {
                                if !thereIsGTC {
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
                                }
                                
                                if !thereIsATB {
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
                                }
                                
    //                            HStack{
    //                                if !vm.isNotificationEnabled {
    //                                    if !vm.check {
    //                                        Button(action: {
    //                                            vm.requestNotificationPermission()
    //                                        }) {
    //                                            HStack{
    //                                                VStack{
    //                                                    HStack{
    //                                                        Text("Turn On Notification")
    //                                                            .foregroundStyle(Color.ABTColor.CharlestonGreen)
    //                                                            .fontWeight(.bold)
    //                                                            .font(.title)
    //                                                        Spacer()
    //                                                    }
    //                                                    HStack{
    //                                                        Text("Let us remind you to do your daily challenges")
    //                                                            .foregroundStyle(Color.ABTColor.CharlestonGreen)
    //                                                            .font(.title3)
    //                                                        Spacer()
    //                                                    }
    //                                                }
    //
    //                                                Spacer()
    //                                                Image(systemName: "chevron.right")
    //                                                    .foregroundStyle(Color.ABTColor.CharlestonGreen)
    //                                                    .background(
    //                                                        Circle()
    //                                                            .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.05)
    //                                                    ).foregroundStyle(Color.ABTColor.MikadoYellow)
    //
    //                                            }
    //                                            .padding(.horizontal,geo.size.width * 0.05)
    //                                            .frame(maxWidth:geo.size.width * 0.94, maxHeight: geo.size.height * 0.13)
    //                                            .background(
    //                                                RoundedRectangle(cornerRadius: 12).fill(Color.ABTColor.DarkSkyBlue)
    //                                            )
    //                                        }
    //                                    }
    //                                    else if vm.check{
    //                                        Button(action: {
    //                                            vm.checkNotificationStatus()
    //                                            vm.requestNotificationPermission()
    //                                            if !vm.isNotificationEnabled {
    //                                                vm.trigger()
    //                                            }
    //                                        }) {
    //                                            HStack{
    //                                                VStack{
    //                                                    HStack{
    //                                                        Text("Turn On Notification")
    //                                                            .foregroundStyle(Color.ABTColor.CharlestonGreen)
    //                                                            .fontWeight(.bold)
    //                                                            .font(.title)
    //                                                        Spacer()
    //                                                    }
    //                                                    HStack{
    //                                                        Text("Let us remind you to do your daily challenges")
    //                                                            .foregroundStyle(Color.ABTColor.CharlestonGreen)
    //                                                            .font(.title3)
    //                                                        Spacer()
    //                                                    }
    //                                                }
    //
    //                                                Spacer()
    //                                                Image(systemName: "chevron.right")
    //                                                    .foregroundStyle(Color.ABTColor.CharlestonGreen)
    //                                                    .background(
    //                                                        Circle()
    //                                                            .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.05)
    //                                                    ).foregroundStyle(Color.ABTColor.MikadoYellow)
    //
    //                                            }
    //                                            .padding(.horizontal,geo.size.width * 0.05)
    //                                            .frame(maxWidth:geo.size.width * 0.94, maxHeight: geo.size.height * 0.13)
    //                                            .background(
    //                                                RoundedRectangle(cornerRadius: 12).fill(Color.ABTColor.DarkSkyBlue)
    //                                            )
    //                                        }
    //                                        .alert(isPresented: $vm.isAlert){
    //
    //                                            Alert(
    //                                                title: Text("Permission Required"),
    //                                                message: Text("Notification access is required for this feature. Please enable it in settings."),
    //                                                primaryButton: .default(Text("Open Settings")) {
    //                                                    vm.openSetting()
    //                                                },
    //                                                secondaryButton: .default(Text("Later")) {
    //
    //                                                }
    //                                            )
    //                                        }
    //
    //                                    }
    //                                }
    //                            }
                            }
                        }
                }
                
            }.padding(.top, 20)
                .padding(.leading, 45)
        }
        .onAppear {
            vm.checkNotificationStatus()
            
            if let lastSession = vm.getLatestSession() {
                let difference = differeceDay(from: lastSession.date)
                
                if difference != 0 {
                    isCoinClaimed = false
                    challengeProgress = 0.0
                }
            }
            
//            if !vm.isNotificationEnabled && isFirstChallenge {
//                totalChallenge += 1
//            }

            thereIsGTC = vm.isAnyChallengeData(workoutType: .grabTheCircles)
            thereIsATB = vm.isAnyChallengeData(workoutType: .avoidTheBlocks)
            
            if thereIsGTC {
                challengeDone += 1
                challengeProgress = Double(challengeDone) / Double(totalChallenge)
            }
            
            if thereIsATB {
                challengeDone += 1
                challengeProgress = Double(challengeDone) / Double(totalChallenge)
            }
            
            if challengeProgress == 1.0 && !isCoinClaimed {
                totalCoin += 50
                isCoinClaimed = true
            }
        }
//        .onChange(of: vm.check) { _, newValue in
//            if newValue && isFirstChallenge {
//                challengeDone += 1
//                challengeProgress = Double(challengeDone) / Double(totalChallenge)
//                isFirstChallenge = false
//            }
//        }
    }
    
    func differeceDay(from: Date) -> Int {
        let calendar = Calendar.current
        let dayComponents = calendar.dateComponents([.day], from: from, to: Date())
        let difference = dayComponents.day!
        return difference
    }
}

#Preview {
    NavigationStack {
        ChallengeView()
            .environmentObject(NavigationManager())
    }
}
