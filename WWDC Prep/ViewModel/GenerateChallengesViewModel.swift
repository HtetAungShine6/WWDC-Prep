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
