//
//  DashboardView.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack {
            Button("Go to Challenge Screen") {
                navigationManager.navigate(to: .challengeView)
            }
        }
        .navigationTitle("Dashboard")
    }
}

#Preview {
    NavigationStack {
        DashboardView()
            .environmentObject(NavigationManager())
    }
}
