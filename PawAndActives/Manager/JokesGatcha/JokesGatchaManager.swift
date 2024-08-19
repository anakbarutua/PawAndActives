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
        if let url = Bundle.main.url(forResource: "jokes", withExtension: "json") {
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
    
    func fetchUnownedJokes() throws -> [String] {
        let jokes: [String] = try loadJson().map { $0.Joke };
        let ownedJokes = jokesCollectionManager.fetchJokes()
        
        return jokes.filter {
            joke in
            return !ownedJokes.map{ $0.joke.Joke }.contains(joke)
        }
    }
    
    func getRandomOne() throws -> String {
        let joke = try fetchUnownedJokes().randomElement()
        
        if(joke == nil){
            throw JokeError.fileEmpty
        }
        
        return joke!
    }
    
}
