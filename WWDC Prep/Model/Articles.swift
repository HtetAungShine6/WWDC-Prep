//
//  Articles.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 9/2/2567 BE.
//

import Foundation

struct Article: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var author: String
    var rating: Int
    var articlViews: Int
    var about: String
}

var sampleArticles: [Article] = [
    .init(title: "Exploring SwiftUI", imageName: "articleImage1", author: "John Doe", rating: 5, articlViews: 1200, about: "Dive deep into SwiftUI's powerful features and learn how to build responsive UIs."),
    .init(title: "The Art of Coding", imageName: "articleImage2", author: "Jane Smith", rating: 4, articlViews: 950, about: "Explore the creativity and artistry behind software development."),
    .init(title: "Future of Technology", imageName: "articleImage3", author: "Emily Clarke", rating: 4, articlViews: 800, about: "Predictions and insights into how technology will shape our future."),
    .init(title: "Design Thinking", imageName: "articleImage4", author: "Alex Johnson", rating: 5, articlViews: 1100, about: "An introduction to design thinking and its impact on product development."),
    .init(title: "Sustainable Energy", imageName: "articleImage5", author: "Michael Brown", rating: 5, articlViews: 1300, about: "The role of renewable energy sources in a sustainable future.")
]

//    static let Articles: [Article] = [
//        Article(title: "Sustainable Living: An Overview", imageName: "articleImage1", content: "Exploring the fundamentals of sustainable living and how individuals can make a difference."),
//        Article(title: "The Benefits of Organic Foods", imageName: "articleImage2", content: "Why organic foods are a healthier option and better for the environment."),
//        Article(title: "Reducing Your Carbon Footprint", imageName: "articleImage3", content: "Practical steps to reduce your carbon footprint and contribute to a healthier planet."),
//        Article(title: "Eco-Friendly Transportation Options", imageName: "articleImage4", content: "From cycling to electric vehicles, explore transportation methods that minimize environmental impact."),
//        Article(title: "The Importance of Recycling", imageName: "articleImage5", content: "How recycling materials can conserve resources and reduce waste."),
//        Article(title: "Conserving Water in Daily Life", imageName: "articleImage6", content: "Simple yet effective ways to save water in your home and garden."),
//        Article(title: "The Impact of Fast Fashion", imageName: "articleImage7", content: "Understanding how fast fashion affects the environment and sustainable alternatives."),
//        Article(title: "Renewable Energy Sources", imageName: "articleImage8", content: "An overview of renewable energy sources and their benefits over fossil fuels."),
//        Article(title: "Green Building and Sustainable Architecture", imageName: "articleImage9", content: "Exploring how green building practices and sustainable architecture contribute to environmental conservation."),
//        Article(title: "Plastic Pollution and How to Reduce It", imageName: "articleImage10", content: "The problem with plastic pollution and actionable steps to reduce plastic use in your daily life.")
//    ]
