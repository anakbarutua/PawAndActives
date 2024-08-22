//
//  WorkoutRepositoryManager.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftData

class WorkoutRepositoryManager {
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = WorkoutRepositoryManager()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: WorkoutDifficulties.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }
    
    func fetchWorkoutDifficulty(workout workoutType: WorkoutType) -> [WorkoutDifficulties] {
        let predicate = #Predicate<WorkoutDifficulties> {
            $0.workoutType == workoutType.rawValue
        }
        
        let fetchDescriptor = FetchDescriptor<WorkoutDifficulties>(predicate: predicate)
        do {
            return try modelContext.fetch(fetchDescriptor)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addDifficulty(_ workoutDifficulty: WorkoutDifficulties) {
        modelContext.insert(workoutDifficulty)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateDifficulty(_ workoutDifficulty: WorkoutDifficulties) {
        do {
            try modelContext.save() 
        } catch {
            fatalError("Failed to update expense: \(error.localizedDescription)")
        }
    }
}
