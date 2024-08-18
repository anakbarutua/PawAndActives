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
        self.modelContainer = try! ModelContainer(for: Joke.self)
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

    func fetchJokes() -> [Joke] {
        do {
            return try modelContext.fetch(FetchDescriptor<Joke>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func removeItem(_ item: Joke) {
        modelContext.delete(item)
    }
}
