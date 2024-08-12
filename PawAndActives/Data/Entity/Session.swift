//
//  Session.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftData

@Model
class Session {
    @Attribute(.unique) var identifier: UUID = UUID()
    var workout: Workout = Workout()
    var score: ScoreDetail = ScoreDetail()
    var challenge: Challenge? = nil
    
    init(workout: Workout, score: ScoreDetail, challenge: Challenge?) {
        self.workout = workout
        self.score = score
        self.challenge = challenge
    }
}
