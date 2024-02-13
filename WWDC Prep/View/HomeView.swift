//
//  ContentView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 8/2/2567 BE.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = GenerateChallengesViewModel()
    @ObservedObject var quizViewModel = QuizViewModel()
    @Namespace private var animation
    @State private var showArticleView = false
    let currentDate = Date()
    @State private var showCustomAlertView = false
    @State private var showProgressView = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    VStack {
                        TriviaSection
                        ChallengesSection
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text(currentDateString())
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button(action: { showProgressView = true }) {
                                Image(systemName: "chart.bar.xaxis.ascending")
                                    .foregroundColor(.black)
                                    .frame(width: 30, height: 30)
                            }
                            Button(action: { showArticleView = true }) {
                                Image(systemName: "book.fill")
                                    .foregroundColor(.black)
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                }
            }
            if showCustomAlertView {
                customAlertView
            }
        }
        .fullScreenCover(isPresented: $showProgressView) {
            progressView
        }
        .fullScreenCover(isPresented: $showArticleView) {
            articleView
        }
    }
    
    private var TriviaSection: some View {
        VStack {
            HStack {
                Text("Trivia Time")
                    .font(.title)
                    .bold()
                Spacer()
                Text("Next quiz in: \(quizViewModel.timerText)")
                    .font(.subheadline)
                    .padding()
            }
            .padding()
            if let currentQuiz = quizViewModel.currentQuiz {
                VStack(alignment: .center, spacing: 10) {
                    Text(currentQuiz.question)
                        .font(.callout)
                        .bold()
                        .padding(.top)
                    Image(systemName: currentQuiz.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding()
                    HStack {
                        VStack {
                            ForEach(currentQuiz.answers[0...1], id: \.self) { answer in
                                answerButton(answer: answer, currentQuiz: currentQuiz)
                            }
                        }
                        
                        VStack {
                            ForEach(currentQuiz.answers[2...], id: \.self) { answer in
                                answerButton(answer: answer, currentQuiz: currentQuiz)
                            }
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .frame(maxWidth: 370, maxHeight: 250)
            }
        }
    }
    
    private var ChallengesSection: some View {
        VStack(alignment: .leading) {
            Text("Today's Challenges")
                .font(.title)
                .bold()
//                .padding(.bottom)
//                .padding(.horizontal)
                .padding()
            
            VStack {
                ProgressBarView(value: CGFloat(viewModel.progress))
                    .frame(height: 20)
                    .padding()
                ForEach(viewModel.dailyChallenges.prefix(4), id: \.self) { challenge in
                    Button(action: {
                        withAnimation {
                            viewModel.toggleChallengeCompletion(challenge)
                        }
                    }) {
                        ChallengeRow(challenge: challenge)
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            .padding(.horizontal)
        }
    }
    
//    private var ToolbarContent: some View {
//        // Implementation of the toolbar content
//        Group {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Text(currentDateString())
//                    .font(.title)
//                    .fontWeight(.semibold)
//            }
//            ToolbarItem(placement: .navigationBarTrailing) {
//                HStack {
//                    Button(action: { showProgressView = true }) {
//                        Image(systemName: "chart.bar.xaxis.ascending")
//                            .foregroundColor(.black)
//                            .frame(width: 30, height: 30)
//                    }
//                    Button(action: { showArticleView = true }) {
//                        Image(systemName: "book.fill")
//                            .foregroundColor(.black)
//                            .frame(width: 30, height: 30)
//                    }
//                }
//            }
//        }
//    }
    
    private func ChallengeRow(challenge: Challenge) -> some View {
        HStack {
            Image(systemName: challenge.icon)
                .foregroundColor(Color.black)
                .font(.title2)
                .padding(.trailing, 8)
            
            Text(challenge.title)
                .foregroundColor(.primary)
                .font(.subheadline)
                .strikethrough(challenge.isCompleted, color: .primary)
            
            Spacer()
            
            Rectangle()
                .frame(width: 1, height: 25)
                .foregroundColor(.gray)
                .padding(.horizontal, 12)
            
            Image(systemName: challenge.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(challenge.isCompleted ? .green : .red)
                .font(.title2)
        }
        .padding()
        .animation(.linear(duration: 0.7), value: challenge.isCompleted)
    }
    
    private var customAlertView: some View {
        CustomAlertView(show: $showCustomAlertView)
            .frame(maxWidth: 300, maxHeight: 400)
            .cornerRadius(20)
            .padding()
    }
    
    @ViewBuilder
    private func answerButton(answer: String, currentQuiz: Quiz) -> some View {
        Button(action: {
            if quizViewModel.selectedAnswer == nil {
                quizViewModel.selectAnswer(answer)
                quizViewModel.selectedAnswer = answer
                quizViewModel.isAnswerCorrect = answer == currentQuiz.correctAnswer
            }
        }) {
            Text(answer)
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(colorForAnswer(answer, in: currentQuiz))
                .cornerRadius(10)
        }
    }
    private func colorForAnswer(_ answer: String, in quiz: Quiz) -> Color {
        guard let selectedAnswer = quizViewModel.selectedAnswer else {
            return Color.gray.opacity(0.2)
        }
        
        if selectedAnswer == answer {
            return quizViewModel.isAnswerCorrect ?? false ? Color.green : Color.red
        } else {
            return (quiz.correctAnswer == answer) ? Color.green.opacity(0.2) : Color.red.opacity(0.2)
        }
    }
    
    private var progressView: some View {
        ProgressView(show: $showProgressView, quizViewModel: quizViewModel)
    }

    private var articleView: some View {
        ArticleView(showArticle: $showArticleView, animation: animation)
    }
    
    func currentDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: currentDate)
    }
}

//struct HomeView: View {
//    
//    @ObservedObject var viewModel = GenerateChallengesViewModel()
//    @ObservedObject var quizViewModel = QuizViewModel()
//    @Namespace private var animation
//    @State private var showArticleView = false
//    @State private var selectedDate: Date = Date()
//    @State private var showCustomAlertView = false
//    @State private var showProgressView = false
//    let currentDate = Date()
//    @State private var selectedAnswer: String? = nil
//    @State private var isAnswerCorrect: Bool? = nil
//    
//    var body: some View {
//        ZStack {
//            NavigationStack {
//                VStack {
//                    HStack{
//                        Text("Trivia Time")
//                            .font(.title)
//                            .bold()
//                        Spacer()
//                        Text("Next quiz in: \(quizViewModel.timerText)")
//                            .font(.subheadline)
//                            .padding()
//                    }
//                    .padding()
//                    if let currentQuiz = quizViewModel.currentQuiz {
//                        VStack(alignment: .center, spacing: 10) {
//                            Text(currentQuiz.question)
//                                .font(.callout)
//                                .bold()
//                                .padding(.top)
//                            Image(systemName: currentQuiz.imageName)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: 40)
//                                .padding()
//                            HStack {
//                                VStack {
//                                    ForEach(currentQuiz.answers[0...1], id: \.self) { answer in
//                                        answerButton(answer: answer, currentQuiz: currentQuiz)
//                                    }
//                                }
//                                
//                                VStack {
//                                    ForEach(currentQuiz.answers[2...], id: \.self) { answer in
//                                        answerButton(answer: answer, currentQuiz: currentQuiz)
//                                    }
//                                }
//                            }
//                        }
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(15)
//                        .shadow(radius: 5)
//                        .frame(maxWidth: 370, maxHeight: 250)
//                    }
//                    HStack{
//                        Text("Today's Challenges ")
//                            .font(.title)
//                            .bold()
//                            .padding()
//                        Spacer()
//                    }
//                    .padding()
//                    ProgressBarView(value: CGFloat(viewModel.progress))
//                        .frame(height: 20)
//                        .padding()
//                        .onChange(of: viewModel.progress) { newValue in
//                            if newValue >= 1.0 {
//                                withAnimation {
//                                    showCustomAlertView = true
//                                }
//                            }
//                        }
//                    ForEach(viewModel.dailyChallenges) { challenge in
//                        Button(action: {
//                            withAnimation {
//                                viewModel.toggleChallengeCompletion(challenge)
//                            }
//                        }) {
//                            challengeRow(challenge: challenge)
//                        }
//                    }
//                    .padding(.horizontal)
//                    .background(Color.white)
//                    .cornerRadius(15)
//                    .shadow(radius: 5)
//                    .frame(maxWidth: 370, maxHeight: 370)
//                }
//                .onAppear {
//                    viewModel.loadDailyChallenges()
//                }
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Text(currentDateString())
//                            .font(.title)
//                            .fontWeight(.semibold)
//                    }
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        HStack {
//                            Button{
//                                showProgressView = true
//                            }label: {
//                                Image(systemName: "chart.bar.xaxis.ascending")
//                                    .foregroundColor(.black)
//                                    .frame(width: 30, height: 30)
//                            }
//                            Button {
//                                withAnimation(.easeInOut(duration: 0.2)) {
//                                    showArticleView = true
//                                }
//                            } label: {
//                                Image(systemName: "book.fill")
//                                    .foregroundColor(.black)
//                                    .frame(width: 30, height: 30)
//                            }
//                        }
//                    }
//                }
//            }
//            if showCustomAlertView {
//                CustomAlertView(show: $showCustomAlertView)
//                    .frame(maxWidth: 300, maxHeight: 400)
//                    .cornerRadius(20)
//                    .padding()
//            }
//        }
//        .fullScreenCover(isPresented: $showProgressView) {
//            ProgressView(show: $showProgressView, quizViewModel: quizViewModel)
//        }
//        .fullScreenCover(isPresented: $showArticleView) {
//            ArticleView(showArticle: $showArticleView, animation: animation)
//        }
//    }
//    
//    func challengeRow(challenge: Challenge) -> some View {
//        HStack {
//            Image(systemName: challenge.icon)
//                .foregroundColor(Color.black)
//                .font(.title2)
//                .padding(.trailing, 8)
//            
//            Text(challenge.title)
//                .foregroundColor(.primary)
//                .font(.subheadline)
//                .strikethrough(challenge.isCompleted, color: .primary)
//            
//            Spacer()
//            
//            Rectangle()
//                .frame(width: 1, height: 25)
//                .foregroundColor(.gray)
//                .padding(.horizontal, 12)
//            
//            Image(systemName: challenge.isCompleted ? "checkmark.circle.fill" : "circle")
//                .foregroundColor(challenge.isCompleted ? .green : .red)
//                .font(.title2)
//        }
//        .animation(.linear(duration: 0.7), value: challenge.isCompleted)
//        .padding()
//        .cornerRadius(10)
//    }
//    @ViewBuilder
//    private func answerButton(answer: String, currentQuiz: Quiz) -> some View {
//        Button(action: {
//            if quizViewModel.selectedAnswer == nil {
//                quizViewModel.selectAnswer(answer)
//                quizViewModel.selectedAnswer = answer
//                quizViewModel.isAnswerCorrect = answer == currentQuiz.correctAnswer
//            }
//        }) {
//            Text(answer)
//                .foregroundColor(.black)
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(colorForAnswer(answer, in: currentQuiz))
//                .cornerRadius(10)
//        }
//    }
//    private func colorForAnswer(_ answer: String, in quiz: Quiz) -> Color {
//        guard let selectedAnswer = quizViewModel.selectedAnswer else {
//            return Color.gray.opacity(0.2)
//        }
//        
//        if selectedAnswer == answer {
//            return quizViewModel.isAnswerCorrect ?? false ? Color.green : Color.red
//        } else {
//            return (quiz.correctAnswer == answer) ? Color.green.opacity(0.2) : Color.red.opacity(0.2)
//        }
//    }
//    
//    func currentDateString() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM d, yyyy"
//        formatter.calendar = Calendar(identifier: .gregorian)
//        formatter.locale = Locale(identifier: "en_US")
//        return formatter.string(from: currentDate)
//    }
//}

#Preview {
    HomeView()
}



//    func determineButtonColor(for answer: String, in quiz: Quiz) -> Color {
//        guard let selectedAnswer = quizViewModel.selectedAnswer else {
//            return Color.gray.opacity(0.2)
//        }
//        if answer == quiz.correctAnswer {
//            return Color.green
//        } else {
//            if selectedAnswer == answer {
//                return Color.red.opacity(0.8)
//            } else {
//                return Color.red.opacity(0.5)
//            }
//        }
//    }

//struct HomeView: View {
//    
//    @ObservedObject var viewModel = GenerateChallengesViewModel()
//    @Namespace private var animation
//    @State private var showTipsView = false
//    @State private var showArticleView = false
//    @State private var showAdvantage = false
//    @State private var text = ""
//    let currentDate = Date()
//    
//    var body: some View {
//        NavigationStack{
//            VStack {
//                CardView(text: viewModel.selectedAdvantage ?? "Complete a challenge to see its advantage.")
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//                    .animation(.easeInOut, value: showAdvantage)
//                    .padding()
//                Text("🌞Challenges for today! ... You can do it💪")
//                    .padding()
//                ProgressBarView(value: CGFloat(viewModel.progress))
//                    .frame(height: 20)
//                    .padding()
//                ForEach(viewModel.dailyChallenges) { challenge in
//                    Button(action: {
//                        withAnimation {
//                            viewModel.toggleChallengeCompletion(challenge)
//                            showAdvantage.toggle()
//                        }
//                    }) {
//                        HStack {
//                            Image(systemName: challenge.icon)
//                                .foregroundColor(Color.black)
//                                .font(.title2)
//                                .padding(.trailing, 8)
//                            Text(challenge.title)
//                                .foregroundColor(.primary)
//                                .font(.title3)
//                                .strikethrough(challenge.isCompleted, color: .primary)
//                            Spacer()
//                            Rectangle()
//                                .frame(width: 1, height: 35)
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 12)
//                            Image(systemName: challenge.isCompleted ? "checkmark.circle.fill" : "circle")
//                                .foregroundColor(challenge.isCompleted ? .green : .red)
//                                .font(.title2)
//                        }
//                        .animation(.linear(duration: 0.7), value: challenge.isCompleted)
//                        .padding()
////                        .background(challenge.isCompleted ? Color.clear : Color.blue)
//                        .background(Color.gray.opacity(0.1))
//                        .cornerRadius(10)
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                    .cornerRadius(20)
//                }
//                .padding(.horizontal)
//            }
//            .onAppear {
//                viewModel.loadDailyChallenges()
//                showAdvantage = true
//            }
//            .toolbar{
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Text(currentDateString())
//                        .font(.title)
//                        .fontWeight(.semibold)
//                }
//                ToolbarItem(placement: .navigationBarTrailing){
//                    HStack{
//                        Button{
//                            withAnimation(.easeInOut(duration: 0.2)){
//                                showTipsView = true
//                            }
//                        }label: {
//                            Image(systemName: "lightbulb.max.fill")
//                                .foregroundColor(.green)
//                                .frame(width: 30, height: 30)
//                        }
//                        Button{
//                            withAnimation(.easeInOut(duration: 0.2)){
//                                showArticleView = true
//                            }
//                        }label: {
//                            Image(systemName: "book.fill")
//                                .foregroundColor(.green)
//                                .frame(width: 30, height: 30)
//                        }
//                    }
//                }
//            }
//        }
//        .fullScreenCover(isPresented: $showTipsView) {
//            TipsView(show: $showTipsView)
//        }
//        .fullScreenCover(isPresented: $showArticleView) {
//            ArticleView(showArticle: $showArticleView, animation: animation)
//        }
//    }
//    func currentDateString() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM d,yyyy"
//        formatter.calendar = Calendar(identifier: .gregorian)
//        formatter.locale = Locale(identifier: "en_US")
//        return formatter.string(from: Date())
//    }
//}




//                ForEach(viewModel.dailyChallenges) { challenge in
//                    Button(action: {
//                        withAnimation {
//                            viewModel.toggleChallengeCompletion(challenge)
//                            showAdvantage.toggle()
//                        }
//                    }) {
//                        HStack {
//                            Image(systemName: challenge.icon)
//                                .foregroundColor(Color.black)
//                                .font(.title2)
//                                .padding(.trailing, 8)
//
//                            Text(challenge.title)
//                                .foregroundColor(.primary)
//                                .font(.title3)
//                                .strikethrough(challenge.isCompleted, color: .primary)
//
//                            Spacer()
//
//                            Rectangle()
//                                .frame(width: 1, height: 35)
//                                .foregroundColor(.gray)
//                                .padding(.horizontal, 12)
//
//                            Image(systemName: challenge.isCompleted ? "checkmark.circle.fill" : "circle")
//                                .foregroundColor(challenge.isCompleted ? .green : .red)
//                                .font(.title2)
//                        }
//                        .animation(.linear(duration: 0.7), value: challenge.isCompleted)
//                        .padding()
//                        .background(Color.gray.opacity(0.1))
//                        .cornerRadius(10)
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                    .cornerRadius(20)
//                }

//
//struct HomeView: View {
//    
//    @ObservedObject var viewModel = GenerateChallengesViewModel()
//    @Namespace private var animation
//    @State private var showTipsView = false
//    @State private var showArticleView = false
//    @State private var showAdvantage = false
//    @State private var selectedDate: Date = Date()
//    @State private var showCustomAlertView = false
//    @State private var showProgressView = false
//    let currentDate = Date()
//    
//    var body: some View {
//        ZStack {
//            NavigationStack {
//                VStack {
//                    if viewModel.progress >= 1.0 {
//                        CardView(text: "Thank you for saving the EARTH 🌏🌱")
//                            .transition(.asymmetric(insertion: .scale, removal: .opacity))
//                            .animation(.easeInOut, value: showAdvantage)
//                            .padding()
//                        //                        .frame(height: 300)
//                    } else {
//                        CardView(text: viewModel.selectedAdvantage ?? "Complete a challenge to see its advantage.")
//                            .transition(.asymmetric(insertion: .scale, removal: .opacity))
//                            .animation(.easeInOut, value: showAdvantage)
//                            .padding()
//                        //                        .frame(height: 300)
//                    }
//                    
////                    Text("🌞 Challenges for today! ... You can do it💪")
////                        .padding()
//                    
//                    //                    ProgressBarView(value: CGFloat(viewModel.progress))
//                    //                        .frame(height: 20)
//                    //                        .padding()
//                    ProgressBarView(value: CGFloat(viewModel.progress))
//                        .frame(height: 20)
//                        .padding()
//                        .onChange(of: viewModel.progress) { newValue in
//                            if newValue >= 1.0 {
//                                // This triggers the CustomAlertView to show when progress is full
//                                withAnimation {
//                                    showCustomAlertView = true
//                                }
//                            }
//                        }
//                    //                ProgressBarView(value: CGFloat(viewModel.progress))
//                    //                    .frame(height: 20)
//                    //                    .padding()
//                    //                    .onChange(of: viewModel.progress) { newValue in
//                    //                        if newValue >= 1.0 {
//                    //                            showCustomAlertView = true
//                    //                        }
//                    //                    }
//                    
//                    //                if viewModel.progress >= 1.0 {
//                    //                    CustomAlertView()
//                    ////                    Text("Congratulations! 🎉 You've completed all your challenges for today!")
//                    ////                        .bold()
//                    ////                        .foregroundColor(.green)
//                    ////                        .padding()
//                    ////                        .background(Color.green.opacity(0.1))
//                    ////                        .cornerRadius(10)
//                    ////                        .transition(.opacity.combined(with: .scale))
//                    ////                        .animation(.easeOut, value: viewModel.progress)
//                    //                }
//                    ForEach(viewModel.dailyChallenges) { challenge in
//                        Button(action: {
//                            withAnimation {
//                                if Calendar.current.isDateInToday(selectedDate) {
//                                    viewModel.toggleChallengeCompletion(challenge)
//                                    showAdvantage.toggle()
//                                }
//                            }
//                        }) {
//                            challengeRow(challenge: challenge)
//                        }
//                        .disabled(!Calendar.current.isDateInToday(selectedDate))
//                    }
//                    .padding(.horizontal)
//                }
//                //                .onChange(of: viewModel.progress) { newValue in
//                //                    if newValue >= 1.0 {
//                //                        withAnimation {
//                //                            showCustomAlertView = true
//                //                        }
//                //                    }
//                //                }
//                .onAppear {
//                    //                viewModel.loadDailyChallenges()
//                    viewModel.loadDailyChallenges()
//                    showAdvantage = true
//                }
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Text(currentDateString())
//                            .font(.title)
//                            .fontWeight(.semibold)
//                    }
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        HStack {
//                            Button{
//                                showProgressView = true
//                            }label: {
//                                Image(systemName: "chart.bar.xaxis.ascending")
//                                    .foregroundColor(.green)
//                                    .frame(width: 30, height: 30)
//                            }
////                            Button {
////                                withAnimation(.easeInOut(duration: 0.2)) {
////                                    showTipsView = true
////                                }
////                            } label: {
////                                Image(systemName: "lightbulb.max.fill")
////                                    .foregroundColor(.green)
////                                    .frame(width: 30, height: 30)
////                            }
//                            Button {
//                                withAnimation(.easeInOut(duration: 0.2)) {
//                                    showArticleView = true
//                                }
//                            } label: {
//                                Image(systemName: "book.fill")
//                                    .foregroundColor(.green)
//                                    .frame(width: 30, height: 30)
//                            }
//                        }
//                    }
//                }
//            }
//            if showCustomAlertView {
//                CustomAlertView(show: $showCustomAlertView)
//                    .frame(maxWidth: 300, maxHeight: 400) // Adjust the frame as necessary
//                    .cornerRadius(20)
//                    .padding()
//            }
//            
//            //        .fullScreenCover(isPresented: $showCustomAlertView) {
//            //            CustomAlertView()
//            //        }
//        }
////        .fullScreenCover(isPresented: $showTipsView) {
////            TipsView(show: $showTipsView)
////        }
//        .fullScreenCover(isPresented: $showProgressView) {
//            ProgressView(show: $showProgressView)
//        }
//        .fullScreenCover(isPresented: $showArticleView) {
//            ArticleView(showArticle: $showArticleView, animation: animation)
//        }
//    }
//    
//    func challengeRow(challenge: Challenge) -> some View {
//        HStack {
//            Image(systemName: challenge.icon)
//                .foregroundColor(Color.black)
//                .font(.title2)
//                .padding(.trailing, 8)
//            
//            Text(challenge.title)
//                .foregroundColor(.primary)
//                .font(.title3)
//                .strikethrough(challenge.isCompleted, color: .primary)
//            
//            Spacer()
//            
//            Rectangle()
//                .frame(width: 1, height: 35)
//                .foregroundColor(.gray)
//                .padding(.horizontal, 12)
//            
//            Image(systemName: challenge.isCompleted ? "checkmark.circle.fill" : "circle")
//                .foregroundColor(challenge.isCompleted ? .green : .red)
//                .font(.title2)
//        }
//        .animation(.linear(duration: 0.7), value: challenge.isCompleted)
//        .padding()
//        .background(Color.gray.opacity(0.1))
//        .cornerRadius(10)
//    }
//    
//    func currentDateString() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM d, yyyy"
//        formatter.calendar = Calendar(identifier: .gregorian)
//        formatter.locale = Locale(identifier: "en_US")
//        return formatter.string(from: currentDate)
//    }
//}
//
//#Preview {
//    HomeView()
//}
