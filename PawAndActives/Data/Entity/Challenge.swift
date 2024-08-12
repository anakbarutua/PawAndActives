//
//  Challenge.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftData

@Model
class Challenge {
    @Attribute(.unique) var identifier: UUID = UUID()
    var date: Date = Date()
    var isComplete: Bool = false
    
    @Relationship(deleteRule: .cascade, inverse: \Session.challenge)
    var sessionDetail: [Session]?
    
    init(date: Date, isComplete: Bool) {
        self.date = date
        self.isComplete = isComplete
    }
}
