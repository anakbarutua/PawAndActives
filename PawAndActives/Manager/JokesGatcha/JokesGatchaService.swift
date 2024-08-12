//
//  JokesGatchaService.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation

protocol JokesGatchaServiceProtocol {
    
    func loadJson() throws -> [JokeDto]
    func getRandomOne() throws -> String;
    
}
