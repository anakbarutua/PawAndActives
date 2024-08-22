//
//  GameRepositoryService.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import SwiftData

protocol GameRepositoryService {
    func fetchAllSession() -> [Session]
    func fetchSessionByDate(by date: Date) -> [Session]
    func fetchHighScore(workout workoutType: WorkoutType) -> Session?
    func addSession(_ session: Session)
}
