//
//  JokesGatchaManager.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import SwiftUI
import SwiftData

class JokesGatchaManager: JokesGatchaServiceProtocol {
    private let jokesCollectionManager: JokesCollectionManager
    
    @MainActor
    static let shared = JokesGatchaManager()

    @MainActor
    private init() {
        self.jokesCollectionManager = JokesCollectionManager.shared
    }

    internal func loadJson() throws -> [JokeDto] {
        if let url = Bundle.main.url(forResource: "jokes-with-category", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([JokeDto].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
                throw JokeError.unexpected
            }
        }
        throw JokeError.fileNotFound
    }
    
    func fetchUnownedJokes() throws -> [JokeDto] {
        let jokes: [JokeDto] = try loadJson();
        
        if ( jokes.count <= 0 ) {
            throw JokeError.fileEmpty
        }
        
        let ownedJokes = jokesCollectionManager.fetchJokes()
        
        return jokes.filter {
            joke in
            return !ownedJokes.map{ $0.joke.Joke }.contains(joke.Joke)
        }
    }
    
    func getRandomOne() throws -> JokeDto {
        let joke = try fetchUnownedJokes().randomElement()
        
        return joke!
    }
    
}
