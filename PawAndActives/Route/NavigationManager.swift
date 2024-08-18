//
//  NavigationManager.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftUI


class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()

    func navigate(to destination: Destination) {
        path.append(destination)
    }

    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func goBackToRoot() {
        path.removeLast(path.count)
    }

    func clearStackAndNavigate(to destination: Destination) {
        DispatchQueue.main.async {
            self.path = NavigationPath()
            self.path.append(destination)
        }
    }
}

enum Destination: Hashable {
    case dashboardView
    case challengeView
    case workoutDetailView(WorkoutType)
    case gameView
    case summaryView
    case jokesGatchaView
    case jokesCollectionView
}

