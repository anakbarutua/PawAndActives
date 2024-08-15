//
//  Router.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftUI

class Router{
    @ViewBuilder
    func view(for destination: Destination) -> some View {
        switch destination {
        case .dashboardView:
            DashboardView()
        case .challengeView:
            ChallengeView()
        case .workoutDetailView:
            WorkoutDetailView()
        case .gameView:
            GameView()
        case .summaryView:
            SummaryView()
        case .jokesGatchaView:
            JokesGatchaView()
        }
    }
}
