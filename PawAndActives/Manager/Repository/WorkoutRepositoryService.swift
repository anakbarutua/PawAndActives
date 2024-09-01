//
//  WorkoutRepositoryService.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftData

protocol WorkoutRepositoryService {
    func fetchWorkoutDifficulty(workout workoutType: WorkoutType) -> [WorkoutDifficulties]
    func addDifficulty(_ workoutDifficulty: WorkoutDifficulties)
    func updateDifficulty(_ workoutDifficulty: WorkoutDifficulties)
}
