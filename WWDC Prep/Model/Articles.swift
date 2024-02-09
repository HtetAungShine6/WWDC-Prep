//
//  Articles.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 9/2/2567 BE.
//

import Foundation

struct Article: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let content: String
    
    static let Articles: [Article] = [
        Article(title: "Sustainable Living: An Overview", imageName: "articleImage1", content: "Exploring the fundamentals of sustainable living and how individuals can make a difference."),
        Article(title: "The Benefits of Organic Foods", imageName: "articleImage2", content: "Why organic foods are a healthier option and better for the environment."),
        Article(title: "Reducing Your Carbon Footprint", imageName: "articleImage3", content: "Practical steps to reduce your carbon footprint and contribute to a healthier planet."),
        Article(title: "Eco-Friendly Transportation Options", imageName: "articleImage4", content: "From cycling to electric vehicles, explore transportation methods that minimize environmental impact."),
        Article(title: "The Importance of Recycling", imageName: "articleImage5", content: "How recycling materials can conserve resources and reduce waste."),
        Article(title: "Conserving Water in Daily Life", imageName: "articleImage6", content: "Simple yet effective ways to save water in your home and garden."),
        Article(title: "The Impact of Fast Fashion", imageName: "articleImage7", content: "Understanding how fast fashion affects the environment and sustainable alternatives."),
        Article(title: "Renewable Energy Sources", imageName: "articleImage8", content: "An overview of renewable energy sources and their benefits over fossil fuels."),
        Article(title: "Green Building and Sustainable Architecture", imageName: "articleImage9", content: "Exploring how green building practices and sustainable architecture contribute to environmental conservation."),
        Article(title: "Plastic Pollution and How to Reduce It", imageName: "articleImage10", content: "The problem with plastic pollution and actionable steps to reduce plastic use in your daily life.")
    ]
}
