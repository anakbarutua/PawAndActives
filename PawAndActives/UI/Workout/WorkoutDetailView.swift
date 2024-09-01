//
//  WorkoutDetailView.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI
import AVFoundation
import AVKit
import SwiftData

struct WorkoutDetailView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject private var workoutViewModel = WorkoutViewModel(repoManager: .shared)
    
    var workoutType: WorkoutType = .grabTheCircles
    
    @State var workoutData: Workout = Workout()
    
    @State var currentDifficulty: Level = Level.medium
    
    @State var highScore: ScoreDetail = ScoreDetail()
    
    @AppStorage("totalCoin")
    var totalCoin: Int = 0
    
    @AppStorage("isFirstGame")
    var isFirstGame: Bool = true
    
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
                            CoinLogo()
                            Text("\(totalCoin)")
                                .font(.system(size: 24))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.ABTColor.Linen)
                        }.scaledToFit()
                            .padding(.horizontal, 18)
                            .padding(.vertical, 8)
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
                        
                        VStack {
                            if workoutType == .grabTheCircles {
                                VideoPlayerView(videoFileName: "GrabTheCircle", videoFileType: "mov", isPlaying: $isPlaying)
                                
                            }else{
                                VideoPlayerView(videoFileName: "AvoidTheBlock", videoFileType: "mov", isPlaying: $isPlaying)
                            }
                        }
                        .overlay {
                            VStack(alignment: .trailing) {
                                HStack(alignment: .bottom) {
                                    Text("Rank")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 28)
                                    
                                    Text((workoutViewModel.highScore == nil) ? "-" : "\(workoutViewModel.highScore!.letterScore.rawValue)")
                                        .font(
                                            (workoutViewModel.highScore == nil) ? .title : .system(size: 128)
                                        )
                                        .fontWeight(.semibold)
                                        .padding(.bottom, (workoutViewModel.highScore == nil) ? 28 : 0 )
                                }
                                .padding(.leading, 12)
                                
                                Text("Highscore: \((workoutViewModel.highScore == nil) ? 0 : workoutViewModel.highScore!.numberScore)")
                                    .font(.title)
                                    .offset(y: -24)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(.trailing, 48)
                            .padding(.bottom, 24)
                            .foregroundStyle(.white)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(
                                        stops: [
                                            .init(color: Color.clear, location: 0.4),
                                            .init(color: Color.black.opacity(0.1), location: 0.5),
                                            .init(color: Color.black.opacity(0.4), location: 0.7),
                                            .init(color: Color.black.opacity(0.75), location: 1.0)
                                        ]
                                    ),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
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
                        
                        Picker("Difficulty", selection: $currentDifficulty){
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
                        navigationManager.navigate(to: .gameView(workoutType, currentDifficulty))
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
            workoutViewModel.workoutType = self.workoutType
            workoutData = workouts.filter { workout in
                workout.type == workoutType
            }.first!
            
            workoutViewModel.addLevelDifficulties()
            
            workoutViewModel.fetchHighScore()
            
            //            let _ = print(workoutViewModel.fetchHighScore())
            
            workoutViewModel.fetchCurrentDifficulty()
            workoutViewModel.isFirstGame = self.isFirstGame
            
        }
        .onChange(of: workoutViewModel.currentDifficulty) {
            self.currentDifficulty = workoutViewModel.currentDifficulty
        }
        .onChange(of: workoutViewModel.highScore) {
            if let highScore = workoutViewModel.highScore {
                self.highScore = highScore
            }
        }
        .onChange(of: workoutViewModel.isFirstGame) {
            isFirstGame = false
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
