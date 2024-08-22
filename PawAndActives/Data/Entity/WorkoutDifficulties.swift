//
//  WorkoutDifficulty.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftData

@Model
class WorkoutDifficulties {
    @Attribute(.unique) var identifier: UUID = UUID()
    
    var workoutType: String = WorkoutType.avoidTheBlocks.rawValue
    var currentDifficulty: String = Level.medium.rawValue
    
    init(workoutType: WorkoutType, currentDifficulty: Level) {
        self.workoutType = workoutType.rawValue
        self.currentDifficulty = currentDifficulty.rawValue
    }
}
