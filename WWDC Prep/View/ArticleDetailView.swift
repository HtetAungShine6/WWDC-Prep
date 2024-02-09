//
//  ArticleDetailView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 10/2/2567 BE.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.imageName)
                    .resizable()
                    .scaledToFit()
                Text(article.title)
                    .font(.title)
                    .padding(.bottom, 2)
                Text(article.content)
                    .font(.body)
            }
            .padding()
        }
    }
}

#Preview {
    ArticleDetailView(article: Article(title: "Sustainable Living: An Overview", imageName: "placeholderImage", content: "Sustainable living involves making choices that reduce one's environmental impact. It's about living in a way that sustains rather than depletes, and that encourages harmony between humans and nature."))
}
