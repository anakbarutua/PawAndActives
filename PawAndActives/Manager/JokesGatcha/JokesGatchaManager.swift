//
//  JokesGatchaManager.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation

class JokesGatchaManager: JokesGatchaServiceProtocol {
    
    static let shared = JokesGatchaManager()

    private init() { }

    internal func loadJson() throws -> [JokeDto] {
        if let url = Bundle.main.url(forResource: "jokes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([JokeDto].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        throw JokeError.fileNotFound
    }
    
    func getRandomOne() throws -> String {
        let jokes = try loadJson();
        let joke = jokes.randomElement()
        
        if(joke == nil){
            throw JokeError.fileEmpty
        }
        
        return joke!.Joke
    }
    
}
