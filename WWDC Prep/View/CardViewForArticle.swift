//
//  CardViewForArticle.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 10/2/2567 BE.
//

import SwiftUI

struct CardViewForArticle: View {
    var article: Article
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(article.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .cornerRadius(10)
            
            Text(article.title)
                .padding(5)
                .background(Color.black.opacity(0.7))
                .font(.caption)
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding([.bottom, .trailing], 10)
        }
        .frame(height: 200)
        .padding(.vertical, 8)
    }
}

#Preview {
    CardViewForArticle(article: Article(title: "Sustainable Living: An Overview", imageName: "placeholderImage", content: "Sustainable living involves making choices that reduce one's environmental impact. It's about living in a way that sustains rather than depletes, and that encourages harmony between humans and nature."))
}
