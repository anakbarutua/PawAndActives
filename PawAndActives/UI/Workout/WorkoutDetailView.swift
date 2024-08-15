//
//  WorkoutDetailView.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI

struct WorkoutDetailView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var difficulty = 1
    
    var workoutType: WorkoutType = .grabTheCircles
    
    @State var workoutData: Workout = Workout()
    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                HStack{
                    Spacer()
                    Text(workoutData.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.trailing, geo.size.width * 0.58)
                    HStack{
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
                    }.padding(.leading, geo.size.width * 0.02)
                    Spacer()
                    
                }
                VStack{
                    Text(workoutData.desc)
                        .font(.system(size: 25))
                        .padding(.top, 0.01 * geo.size.height)
                        .padding(.horizontal, geo.size.width * 0.1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image("")
                        .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.6)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.Linen))
                    HStack{
                        Text("Difficulty")
                            .foregroundColor(Color.ABTColor.Black)
                        
                        Spacer()
                        
                        Picker("Difficulty", selection: $difficulty){
                            Text("Easy").tag(0)
                            Text("Medium").tag(1)
                            Text("Hard").tag(2)
                        }
                        .accentColor(Color.ABTColor.PrussianBlue)
                    }
                    .padding(.horizontal, 18)
                    .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.05)
                    .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.ABTColor.BananaMania))
                    .padding(.top, geo.size.height * 0.015)
                        
                    ButtonView(label: "Start Workout"){
                    // Custom action
                    }.frame(width: geo.size.width * 0.8, height: geo.size.height * 0.07)
                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.ABTColor.BananaMania))
                        .padding(.top, geo.size.height * 0.006)

                }
            }
        }
        .onAppear {
            workoutData = workouts.filter { workout in
                workout.type == workoutType
            }.first!
            
            
        }
    }
}

#Preview {
    WorkoutDetailView()
        .environmentObject(NavigationManager())
}
