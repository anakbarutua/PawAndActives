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
    
    
}
