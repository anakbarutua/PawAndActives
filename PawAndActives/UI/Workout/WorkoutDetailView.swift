//
//  WorkoutDetailView.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI
import AVFoundation
import AVKit

struct WorkoutDetailView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject private var workoutViewModel = WorkoutViewModel(
        videoURL1: URL(string: "https://streamable.com/3xu38n")!,videoURL2: URL(string: "https://streamable.com/phcfzi")!)
    @State private var difficulty: Level = .easy
    
    var workoutType: WorkoutType = .grabTheCircles
    
    @State var workoutData: Workout = Workout()
    
    @State private var isPlaying = false
    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                HStack{
                    Spacer()
                    Text(workoutData.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.ABTColor.CharlestonGreen)
                        .padding(.trailing, geo.size.width * 0.58)
                    HStack{
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
                            .frame(width: 0.0865 * geo.size.width, height: 0.056 * geo.size.height)
                            .padding(.trailing, 0.03 * geo.size.width)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.ABTColor.SteelBlue))
                    }.padding(.leading, geo.size.width * 0.02)
                    Spacer()
                    
                }
                VStack{
                    Text(workoutData.desc)
                        .font(.system(size: 25))
                        .foregroundColor(Color.ABTColor.CharlestonGreen)
                        .padding(.top, 0.01 * geo.size.height)
                        .padding(.horizontal, geo.size.width * 0.1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack {
                        
                        if workoutType == .grabTheCircles {
                            VideoPlayerView(videoFileName: "GrabTheCircle", videoFileType: "mov", isPlaying: $isPlaying)
                            
                        }else{
                            VideoPlayerView(videoFileName: "AvoidTheBlock", videoFileType: "mov", isPlaying: $isPlaying)
                        }
                        
                        if !isPlaying {
                            Button(action: {
                                isPlaying = true
                            }) {
                                Image(systemName: "play.circle")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.white)
                                    .shadow(radius: 10)
                            }
                        } else {
                            Button(action: {
                                isPlaying = false
                            }) {
                                Image(systemName: "pause.circle")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.white)
                                    .shadow(radius: 10)
                                    .opacity(0.3)
                            }
                        }
                    }
                    .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.6)

                    HStack{
                        Text("Difficulty")
                            .foregroundColor(Color.ABTColor.CharlestonGreen)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Picker("Difficulty", selection: $difficulty){
                            ForEach(Level.allCases, id: \.self) { level in
                                Text(level.rawValue)
                            }
                        }
                        .accentColor(Color.ABTColor.CharlestonGreen)
                        
                    }
                    .padding(.horizontal, 18)
                    .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.05)
                    .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.ABTColor.DarkSkyBlue))
                    .padding(.top, geo.size.height * 0.015)
                    
                    ButtonView(label: "Start Workout"){
                        navigationManager.navigate(to: .gameView(workoutType, difficulty))
                    }
                    .alert(isPresented: $workoutViewModel.showPermissionAlert){
                        Alert(
                            title: Text("Permission Required"),
                            message: Text("Camera access is required for this feature. Please enable it in settings."),
                            dismissButton: .default(Text("Open Settings")){
                                workoutViewModel.openSetting()
                            }
                        )
                    }
                    .padding(.horizontal, 0.1 * geo.size.width)
                    
                }
            }
        }
        .onAppear {
            workoutData = workouts.filter { workout in
                workout.type == workoutType
            }.first!
            
        }
    }
    
    struct VideoPlayerView: UIViewControllerRepresentable {
        let videoFileName: String
        let videoFileType: String
        @Binding var isPlaying: Bool
        
        func makeUIViewController(context: Context) -> AVPlayerViewController {
            let controller = AVPlayerViewController()
            if let path = Bundle.main.path(forResource: videoFileName, ofType: videoFileType) {
                let player = AVPlayer(url: URL(fileURLWithPath: path))
                controller.player = player
                controller.showsPlaybackControls = false // Hide default controls
            }
            return controller
        }
        
        func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
            if isPlaying {
                uiViewController.player?.play()
            } else {
                uiViewController.player?.pause()
            }
        }
    }
    
}

#Preview {
    WorkoutDetailView()
        .environmentObject(NavigationManager())
}
