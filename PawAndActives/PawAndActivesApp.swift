//
//  PawAndActivesApp.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 12/08/24.
//

import SwiftUI
import SwiftData

@main
struct PawAndActivesApp: App {
    
    @StateObject private var navigationManager = NavigationManager()
    private var router = Router()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationManager.path) {
                router.view(for: .dashboardView)
                    .navigationDestination(for: Destination.self) { destination in
                        router.view(for: destination)
                    }
            }
            .environmentObject(navigationManager)
        }
    }
}
