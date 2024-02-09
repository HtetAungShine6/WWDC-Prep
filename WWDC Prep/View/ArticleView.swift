//
//  ArticleView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 8/2/2567 BE.
//

import SwiftUI

struct ArticleView: View {
    let articles: [Article] = Article.Articles
    var body: some View {
        NavigationStack {
            List(articles) { article in
                NavigationLink(destination: ArticleDetailView(article: article)) {
                    CardViewForArticle(article: article)
                }
            }
        }
    }
}


#Preview {
    ArticleView()
}
