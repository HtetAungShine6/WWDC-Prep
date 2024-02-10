//
//  ContentView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 8/2/2567 BE.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = GenerateChallengesViewModel()
    @Namespace private var animation
    @State private var showTipsView = false
    @State private var showArticleView = false
    @State private var showAdvantage = false
    @State private var text = ""
    let currentDate = Date()
    
    var body: some View {
        NavigationStack{
            VStack {
                CardView(text: viewModel.selectedAdvantage ?? "Select a challenge to see its advantage.")
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    .animation(.easeInOut, value: showAdvantage)
                Text("🌞Challenges for today! ... You can do it💪")
                ProgressBarView(value: CGFloat(viewModel.progress))
                    .frame(height: 20)
                    .padding()
                ForEach(viewModel.dailyChallenges) { challenge in
                    Button(action: {
                        withAnimation {
                            viewModel.toggleChallengeCompletion(challenge)
                            showAdvantage.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: challenge.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(challenge.isCompleted ? .green : .red)
                            Text(challenge.title)
                                .tint(Color.black)
                                .font(.title3)
                            Spacer()
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                viewModel.loadDailyChallenges()
                showAdvantage = true
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(currentDateString())
                        .font(.title)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack{
                        Button{
                            withAnimation(.easeInOut(duration: 0.2)){
                                showTipsView = true
                            }
                        }label: {
                            Image(systemName: "lightbulb.max")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
//                                .bold()
                        }
                        Button{
                            withAnimation(.easeInOut(duration: 0.2)){
                                showArticleView = true
                            }
                        }label: {
                            Image(systemName: "book")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
//                                .bold()
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showTipsView) {
            TipsView(show: $showTipsView)
        }
        .fullScreenCover(isPresented: $showArticleView) {
            ArticleView(showArticle: $showArticleView, animation: animation)
        }
    }
    func currentDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d,yyyy"
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: Date())
    }
}

#Preview {
    HomeView()
}
