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
    
    func requestNotificationPermission() {
        NotificationManager.shared.requestNotificationPermission { granted in
            DispatchQueue.main.async {
                self.isNotificationEnabled = granted
            }
        }
    }
    
    func checkNotificationStatus() {
        NotificationManager.shared.checkNotificationStatus { isEnabled in
            DispatchQueue.main.async {
                self.isNotificationEnabled = isEnabled
            }
        }
    }
}
