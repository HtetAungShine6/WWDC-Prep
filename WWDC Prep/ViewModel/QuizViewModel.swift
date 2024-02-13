//
//  QuizViewModel.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 13/2/2567 BE.
//

import Foundation
import Combine

class QuizViewModel: ObservableObject {
    
    @Published var quizzes: [Quiz] = []
    @Published var currentQuizIndex: Int = 0
    @Published var selectedAnswer: String? = nil
    @Published var isAnswerCorrect: Bool? = nil
    @Published var timerText: String = "00:10"
    @Published var correctAnswersCount: Int = 0
    @Published var quizScores: [String: Int] = [:]
    
    var totalQuizzes: Int {
        quizzes.count
    }
    private var quizChangeTimer: Timer?
    private var countdown: Int = 60
    
    init() {
        loadQuizzes()
        startTimers()
    }
    
    private func loadQuizzes() {
        quizzes = sampleQuizzes
        currentQuizIndex = 0
        resetCountdown()
    }
    
    var currentQuiz: Quiz? {
        quizzes.count > currentQuizIndex ? quizzes[currentQuizIndex] : nil
    }
    
    //    func selectAnswer(_ answer: String) {
    //        guard let currentQuiz = currentQuiz else { return }
    //
    //        selectedAnswer = answer
    //        isAnswerCorrect = answer == currentQuiz.correctAnswer
    //        if isAnswerCorrect == true {
    //            correctAnswersCount += 1
    //        }
    //    }
    
    func selectAnswer(_ answer: String) {
        guard currentQuizIndex < quizzes.count else { return }
        
        var currentQuiz = quizzes[currentQuizIndex]
        currentQuiz.userAnswer = answer
        currentQuiz.isCorrect = (answer == currentQuiz.correctAnswer)
        
        if currentQuiz.isCorrect == true {
            correctAnswersCount += 1
        }
        
        quizzes[currentQuizIndex] = currentQuiz 
    }
    
    func nextQuiz() {
        isAnswerCorrect = nil
        selectedAnswer = nil
        currentQuizIndex = (currentQuizIndex + 1) % quizzes.count
        resetCountdown()
        objectWillChange.send()
    }
    
    private func startTimers() {
        quizChangeTimer?.invalidate()
        countdown = 10
        updateTimerText()
        quizChangeTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.countdown -= 1
            self.updateTimerText()
            if self.countdown <= 0 {
                self.nextQuiz()
                self.resetCountdown()
            }
        }
    }
    
    func updateScore(forQuizID quizID: String, withScore score: Int) {
        quizScores[quizID] = score
    }
    var scoresForChart: [Double] {
        quizScores.map { Double($0.value) }
    }
    private func resetCountdown() {
        countdown = 10
        updateTimerText()
    }

    private func updateTimerText() {
        timerText = String(format: "00:%02d", countdown)
    }

    deinit {
        quizChangeTimer?.invalidate()
    }
}
