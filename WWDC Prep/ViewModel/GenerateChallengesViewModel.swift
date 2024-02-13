//
//  GenerateChallengesViewModel.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 9/2/2567 BE.
//

import Foundation
import Combine
import SwiftUI


class GenerateChallengesViewModel: ObservableObject {
    
    //    @Published var dailyChallenges: [Challenge] = []
    @Published var dailyChallenges: [Challenge] = Challenge.allChallenges.shuffled().prefix(4).map { $0 }
    @Published var selectedAdvantage: String? = nil
    
    init() {
        refreshChallenges()
    }
    
    func loadDailyChallenges() {
        refreshChallenges()
    }
    
    func refreshChallenges() {
        dailyChallenges = Challenge.allChallenges.shuffled().prefix(4).map { $0 }
    }
    
    func toggleChallengeCompletion(_ challenge: Challenge) {
        if let index = dailyChallenges.firstIndex(where: { $0.id == challenge.id }) {
            dailyChallenges[index].isCompleted.toggle()
            selectedAdvantage = dailyChallenges[index].isCompleted ? dailyChallenges[index].advantage : nil
        }
    }
    
    var progress: Float {
        let completedCount = dailyChallenges.filter { $0.isCompleted }.count
        return completedCount == 0 ? 0 : Float(completedCount) / Float(dailyChallenges.count)
    }
}

//class GenerateChallengesViewModel: ObservableObject {
//    
//    @Published var dailyChallenges: [Challenge] = []
//    @Published var selectedAdvantage: String? = nil
//    private var allChallenges: [Challenge] = Challenge.allChallenges
//    
//    init() {
//        loadDailyChallenges()
//    }
//    
//    func loadDailyChallenges(for date: Date = Date()) {
//        // Filter challenges for the current date
//        let calendar = Calendar.current
//        dailyChallenges = allChallenges.filter { challenge in
//            return calendar.isDate(challenge.date, inSameDayAs: date)
//        }.shuffled().prefix(4).map { $0 } // Shuffle and take a subset if needed
//        
//        // Optionally, you could refresh challenges from a data source here
//    }
//    
//    func toggleChallengeCompletion(_ challenge: Challenge) {
//        guard let index = dailyChallenges.firstIndex(where: { $0.id == challenge.id }) else { return }
//        
//        dailyChallenges[index].isCompleted.toggle() // Toggle completion status
//        // Update the advantage based on the new completion status
//        selectedAdvantage = dailyChallenges[index].isCompleted ? dailyChallenges[index].advantage : nil
//        // You might want to save this change to a persistent storage or backend
//    }
//    
//    var progress: Float {
//        let completedCount = dailyChallenges.filter { $0.isCompleted }.count
//        return dailyChallenges.isEmpty ? 0 : Float(completedCount) / Float(dailyChallenges.count)
//    }
//}
