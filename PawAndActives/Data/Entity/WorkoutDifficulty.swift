//
//  WorkoutDifficulty.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftData

@Model
class WorkoutDifficulty {
    @Attribute(.unique) var identifier: UUID = UUID()
    
    var workoutType: String = WorkoutType.avoidTheBlocks.rawValue
    var currentDifficulty: String = Level.easy.rawValue
    
    init(workoutType: String, currentDifficulty: String) {
        self.workoutType = workoutType
        self.currentDifficulty = currentDifficulty
    }
}
