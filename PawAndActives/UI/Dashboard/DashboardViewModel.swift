//
//  DashboardViewModel.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI
import UserNotifications

class DashboardViewModel: ObservableObject{
    @Published var isNotificationEnabled = false
    @Published var isAlert = false
    @Published var check = false
    
    private let repoManager: JokesCollectionManager
    
    init(repoManager: JokesCollectionManager) {
        self.repoManager = repoManager
    }
    
    func requestNotificationPermission() {
        NotificationManager.shared.requestNotificationPermission { granted in
            DispatchQueue.main.async {
                self.isNotificationEnabled = granted
                self.check = true
            }
        }
    }
    
    func checkNotificationStatus() {
        NotificationManager.shared.checkNotificationStatus { isEnabled in
            DispatchQueue.main.async {
                self.isNotificationEnabled = isEnabled
                if !isEnabled{
                    self.check = true
                } else {
                    self.check = false
                }
            }
        }
    }
    
    func trigger(){
        self.isAlert = true
    }
    
    func openSetting(){
        guard let settingsUrl = URL(string: UIApplication.openNotificationSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl){
            UIApplication.shared.open(settingsUrl)
        }
    }
    
    func isAnyChallengeData(workoutType: WorkoutType) -> Bool {
        let todaySessions: [Session] = repoManager.fetchSessionByDate(by: .now, workout: workoutType)
        
        let isAny = todaySessions.contains(where: { $0.workout == workoutType.rawValue })
        return isAny
    }
    
    func getLatestSession() -> Session? {
        let lastSession: [Session] = repoManager.fetchAllSession()
        return lastSession.last
    }
}
