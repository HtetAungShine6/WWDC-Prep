//
//  ProgressView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 13/2/2567 BE.
//

import SwiftUI

struct ProgressView: View {
    @Binding var show: Bool
    @ObservedObject var quizViewModel: QuizViewModel

    var body: some View {
        NavigationView {
            List {
//                ForEach(0..<quizViewModel.currentQuizIndex, id: \.self) { index in
//                    let quiz = quizViewModel.quizzes[index]
//                    let isCorrect = quiz.correctAnswer == quizViewModel.selectedAnswer
//                    let userAnswer = quizViewModel.selectedAnswer ?? "No Answer"
//                    
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text(quiz.question)
//                                .font(.headline)
//                            Text("Your answer: \(userAnswer)")
//                                .font(.subheadline)
//                                .foregroundColor(.secondary)
//                        }
//                        Spacer()
//                        Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
//                            .foregroundColor(isCorrect ? .green : .red)
//                    }
//                }
                ForEach(0..<quizViewModel.currentQuizIndex, id: \.self) { index in
                    let quiz = quizViewModel.quizzes[index]
                    if let userAnswer = quiz.userAnswer, let isCorrect = quiz.isCorrect {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(quiz.question)
                                    .font(.headline)
                                Text("Your answer: \(userAnswer)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(isCorrect ? .green : .red)
                        }
                    }
                }
            }
            .navigationTitle("Quiz Progress")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        show = false
                    }
                }
            }
        }
    }
}



//struct ProgressView: View {
//    @Binding var show: Bool
//    @ObservedObject var quizViewModel: QuizViewModel
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Spacer()
//                
//                // Graphical Representation of Quiz Progress
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("Quiz Progress")
//                        .font(.headline)
//                        .padding(.bottom, 5)
//                    
//                    GeometryReader { geometry in
//                        let total = max(quizViewModel.currentQuizIndex, 1) // Avoid division by zero
//                        let width = geometry.size.width
//                        let correctFraction = CGFloat(quizViewModel.correctAnswersCount) / CGFloat(total)
//                        let wrongFraction = CGFloat(total - quizViewModel.correctAnswersCount) / CGFloat(total)
//                        
//                        HStack(spacing: 0) {
//                            Rectangle()
//                                .fill(Color.green)
//                                .frame(width: width * correctFraction)
//                            Rectangle()
//                                .fill(Color.red)
//                                .frame(width: width * wrongFraction)
//                        }
//                        .cornerRadius(5)
//                    }
//                    .frame(height: 30)
//                }
//                .padding()
//                .background(Color.secondary.opacity(0.1))
//                .cornerRadius(10)
//                
//                Spacer()
//                
//                // Close Button
//                Button("Close") {
//                    show = false
//                }
//                .padding()
//                .foregroundColor(.white)
//                .background(Color.blue)
//                .cornerRadius(10)
//                .padding()
//            }
//            .padding()
//            .navigationTitle("Quiz Progress")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}

//struct ProgressView: View {
//    @Binding var show: Bool
//    @ObservedObject var quizViewModel: QuizViewModel
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Chart {
//                    ForEach(quizViewModel.quizzes) { quiz in
//                        if let score = quizViewModel.quizScores[quiz.id] {
//                            BarMark(
//                                x: .value("Quiz", quiz.question), 
//                                y: .value("Score", score)
//                            )
//                        }
//                    }
//                }
//                .chartXAxis(.hidden)
//                .chartYAxis(.hidden)
//                .frame(height: 300)
//
//                Button("Close") {
//                    show = false
//                }
//                .padding()
//            }
//            .navigationTitle("Quiz Progress")
//        }
//    }
//}


//struct ProgressView: View {
//    @Binding var show: Bool
//    var body: some View {
//        HStack{
//            Button{
//                show = false
//            }label: {
//                Image(systemName: "chevron.left")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.black)
//                    .contentShape(Rectangle())
//            }
//            .padding()
//            Text("Hello from Progress View")
//                .font(.title2.bold())
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .padding(.horizontal,15)
//    }
//}



//struct ProgressView: View {
//    @ObservedObject var quizViewModel: QuizViewModel
//    @Binding var show: Bool
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Button(action: {
//                    show = false
//                }) {
//                    Image(systemName: "chevron.left")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black)
//                }
//                .padding()
//                
//                Spacer()
//                
//                Text("Quiz Progress")
//                    .font(.headline)
//                
//                Spacer()
//                
//                Button(action: {
//                    // Action to restart or clear quiz progress
//                }) {
//                    Image(systemName: "gobackward")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black)
//                }
//                .padding()
//            }
//            
//            // Dynamic Chart or Progress Representation
//            VStack {
//                Text("Correct Answers: \(quizViewModel.correctAnswersCount)")
//                    .foregroundColor(.green)
//                    .padding(.bottom, 2)
//                
//                Text("Wrong Answers: \(quizViewModel.wrongAnswersCount)")
//                    .foregroundColor(.red)
//                    .padding(.bottom, 2)
//                
//                // Assuming a simple bar chart representation for demonstration
//                HStack(alignment: .bottom) {
//                    VStack {
//                        Rectangle()
//                            .fill(Color.green)
//                            .frame(width: 50, height: CGFloat(quizViewModel.correctAnswersCount) * 5) // Example scaling
//                        Text("Correct")
//                    }
//                    VStack {
//                        Rectangle()
//                            .fill(Color.red)
//                            .frame(width: 50, height: CGFloat(quizViewModel.wrongAnswersCount) * 5) // Example scaling
//                        Text("Wrong")
//                    }
//                }
//                .padding()
//                .animation(.default, value: quizViewModel.correctAnswersCount)
//                .animation(.default, value: quizViewModel.wrongAnswersCount)
//            }
//            .padding()
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(12)
//        .shadow(radius: 5)
//    }
//}


//struct ProgressView: View {
//    @Binding var show: Bool
//    var correctAnswerCount: Int
//    var wrongAnswerCount: Int
//
//    private var totalAnswers: Int { correctAnswerCount + wrongAnswerCount }
//    private var correctAnswerRatio: CGFloat { totalAnswers > 0 ? CGFloat(correctAnswerCount) / CGFloat(totalAnswers) : 0 }
//    private var wrongAnswerRatio: CGFloat { totalAnswers > 0 ? CGFloat(wrongAnswerCount) / CGFloat(totalAnswers) : 0 }
//
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Quiz Results")
//                    .font(.headline)
//                Spacer()
//                Button("Close") {
//                    show = false
//                }
//            }
//            .padding()
//
//            HStack(alignment: .bottom, spacing: 12) {
//                VStack {
//                    Capsule()
//                        .frame(width: 50, height: correctAnswerRatio * 200)
//                        .foregroundColor(.green)
//                    Text("Correct")
//                }
//                VStack {
//                    Capsule()
//                        .frame(width: 50, height: wrongAnswerRatio * 200)
//                        .foregroundColor(.red)
//                    Text("Wrong")
//                }
//            }
//            .padding()
//        }
//    }
//}


//struct ProgressView: View {
//    @Binding var show: Bool
//    var body: some View {
//        HStack{
//            Button{
//                show = false
//            }label: {
//                Image(systemName: "chevron.left")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.black)
//                    .contentShape(Rectangle())
//            }
//            .padding()
//            Text("Hello from Progress View")
//                .font(.title2.bold())
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .padding(.horizontal,15)
//    }
//}


//struct ProgressView: View {
//    @Binding var show: Bool
//    var scores: [Int] // Assuming scores are percentages
//    
//    var body: some View {
//        VStack {
//            // Close button and title
//            HStack {
//                Button {
//                    show = false
//                } label: {
//                    Image(systemName: "chevron.left")
//                        .font(.title3)
//                        .foregroundColor(.black)
//                }
//                .padding()
//                Spacer()
//                Text("Quiz Progress")
//                    .font(.headline)
//                Spacer()
//            }
//            
//            // Bar chart
//            GeometryReader { geometry in
//                VStack(alignment: .leading, spacing: 4) {
//                    ForEach(scores.indices, id: \.self) { index in
//                        BarView(score: scores[index], maxWidth: geometry.size.width)
//                    }
//                }
//            }
//            .padding()
//        }
//    }
//}
//
//struct BarView: View {
//    var score: Int
//    var maxWidth: CGFloat
//    
//    var body: some View {
//        Rectangle()
//            .fill(score >= 50 ? Color.green : Color.red) // Conditional color
//            .frame(width: CGFloat(score) / 100 * maxWidth, height: 20) // Calculate width based on score
//            .cornerRadius(5)
//            .overlay(
//                Text("\(score)%")
//                    .foregroundColor(.white)
//                    .padding(.leading, 4),
//                alignment: .leading
//            )
//    }
//}


//struct ProgressView: View {
//    @Binding var show: Bool
//    var scores: [Double] // Pass this array to the view
//
//    var body: some View {
//        VStack {
//            HStack {
//                Button {
//                    show = false
//                } label: {
//                    Image(systemName: "chevron.left")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black)
//                        .contentShape(Rectangle())
//                }
//                .padding()
//
//                Text("Quiz Progress")
//                    .font(.title2.bold())
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.horizontal, 15)
//
//            // Simple bar chart
//            VStack(alignment: .leading) {
//                ForEach(scores.indices, id: \.self) { index in
//                    Rectangle()
//                        .fill(scores[index] > 0 ? Color.green : Color.red)
//                        .frame(height: 20)
//                        .cornerRadius(5)
//                        .padding(.vertical, 2)
//                        .overlay(Text("Quiz \(index+1): \(Int(scores[index])) Correct").font(.caption).padding(.leading, 5), alignment: .leading)
//                }
//            }
//            .padding()
//        }
//    }
//}


//struct ProgressView: View {
//    @Binding var show: Bool
//    var body: some View {
//        HStack{
//            Button{
//                show = false
//            }label: {
//                Image(systemName: "chevron.left")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.black)
//                    .contentShape(Rectangle())
//            }
//            .padding()
//            Text("Hello from Progress View")
//                .font(.title2.bold())
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .padding(.horizontal,15)
//    }
//}
