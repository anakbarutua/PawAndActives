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
    
    var date: Date = Date()
    var workout: String = WorkoutType.avoidTheBlocks.rawValue
    var score: ScoreDetail = ScoreDetail()
    
    init(date: Date, workout: WorkoutType, score: ScoreDetail) {
        self.date = date
        self.workout = workout.rawValue
        self.score = score
    }
}
