//
//  Workout.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation

struct Workout: Codable, Hashable {
    var name: String = ""
    var desc: String = ""
    var video: Data? = nil
    var type: WorkoutType = .grabTheCircles
}
