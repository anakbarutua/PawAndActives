//
//  JokesCollectionManager.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 18/08/24.
//

import SwiftUI
import SwiftData

final class JokesCollectionManager {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    static let shared = JokesCollectionManager()

    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Joke.self, Session.self, WorkoutDifficulties.self)
        self.modelContext = modelContainer.mainContext
    }
    
    internal func save() {
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func toggleJokeIsFavorite(joke: Joke) {
        joke.isFavorite = !joke.isFavorite;
        save()
    }

    func appendJoke(joke: Joke) {
        modelContext.insert(joke)
        save()
    }
    
    func fetchJokesNotReversed() -> [Joke] {
        do {
            return try modelContext.fetch(FetchDescriptor<Joke>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func fetchJokes() -> [Joke] {
        let jokes = fetchJokesNotReversed()
        
        return jokes.reversed()
    }

    func removeItem(_ item: Joke) {
        modelContext.delete(item)
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
            $0.date >= startOfDay && $0.date < endOfDay && $0.workout == workoutType.rawValue
        }
        
        let fetchDescriptor = FetchDescriptor<Session>(predicate: predicate)
        
        do {
            return try modelContext.fetch(fetchDescriptor)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchHighScore(workout workoutType: WorkoutType) -> Session? {
        let predicate = #Predicate<Session> {
            $0.workout == workoutType.rawValue
        }

        let fetchDescriptor = FetchDescriptor<Session>(predicate: predicate)
        
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
