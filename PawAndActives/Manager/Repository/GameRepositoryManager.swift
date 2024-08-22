//
//  GameRepositoryManager.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftData

class GameRepositoryManager {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = GameRepositoryManager()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Session.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }
    
    func fetchAllSession() -> [Session] {
        do {
            return try modelContext.fetch(FetchDescriptor<Session>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchSessionByDate(by date: Date, workout workoutType: WorkoutType) -> [Session] {
        let startOfDay = Calendar.current.startOfDay(for: date)
        let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!
        
        // Use the Predicate type to filter expenses
        let predicate = #Predicate<Session> {
            $0.date >= startOfDay && $0.date < endOfDay
        }
        
        let fetchDescriptor = FetchDescriptor<Session>(predicate: predicate)
        
        do {
            return try modelContext.fetch(fetchDescriptor)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchHighScore(workout workoutType: WorkoutType) -> Session? {
//        let predicate = #Predicate<Session> {
//            $0.workout == workoutType.rawValue
//        }
//        
//        let fetchDescriptor = FetchDescriptor<Session>(predicate: predicate)
        let fetchDescriptor = FetchDescriptor<Session>()
        
        do {
            let sessions = try modelContext.fetch(fetchDescriptor)
            return sessions.max(by: { $0.score.numberScore < $1.score.numberScore })
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addSession(_ session: Session) {
        modelContext.insert(session)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
}
