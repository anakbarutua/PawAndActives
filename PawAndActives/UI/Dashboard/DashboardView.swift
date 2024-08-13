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
            
            Image.ABTImage.GTCIcon
            
            Button("Go to Challenge Screen") {
                navigationManager.navigate(to: .challengeView)
            }
            .foregroundStyle(Color.ABTColor.PrussianBlue)
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
