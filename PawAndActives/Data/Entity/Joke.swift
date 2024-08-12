//
//  Joke.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftData

@Model
class Joke {
    @Attribute(.unique) var identifier: UUID = UUID()
    var joke: JokeDto = JokeDto()
    var isFavorite: Bool = false
    
    init(joke: JokeDto, isFavorite: Bool) {
        self.joke = joke
        self.isFavorite = isFavorite
    }
}
