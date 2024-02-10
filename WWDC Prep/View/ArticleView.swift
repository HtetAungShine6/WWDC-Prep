//
//  ArticleView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 8/2/2567 BE.
//

import SwiftUI

struct ArticleView: View {
    //    @State private var activeTag: String = "History"
    @Binding var showArticle: Bool
    @State private var carouselMode: Bool = false
//    @Namespace private var animation
    var animation: Namespace.ID
    @State private var showDetailView: Bool = false
    @State private var selectedBook: Article?
    @State private var animateCurrentBook: Bool = false
    var body: some View {
        VStack(spacing: 35){
            HStack{
                Button{
                    showArticle = false
                }label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .contentShape(Rectangle())
                }
                .padding()
//                .padding([.leading, .vertical], 15)
//                .frame(maxWidth: .infinity, alignment: .leading)
                Text("Recommended Articles")
                    .font(.largeTitle.bold())
//                Text("Recommended")
//                    .fontWeight(.semibold)
//                    .padding(.leading, 15)
//                    .foregroundColor(.gray)
//                    .offset(y: 2)
                Spacer(minLength: 10)
                Menu{
                    Button("Toggle Carousel Mode (\(carouselMode ? "On" : "Off"))"){
                        carouselMode.toggle()
                    }
                }label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.init(degrees: -90))
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal,15)
            
            //            TagsView()
            
            GeometryReader{
                let size = $0.size
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 15){
                        ForEach(sampleArticles){ book in
                            BookCardView(book)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)){
                                        animateCurrentBook = true
                                        selectedBook = book
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                                            showDetailView = true
                                        }
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                    .padding(.bottom, bottomPadding(size))
                    .background{
                        ScrollViewDetector(carouseMode: $carouselMode, totalCardCount: sampleArticles.count)
                    }
                }
                .coordinateSpace(name: "SCROLLVIEW")
            }
            .padding(.top, 15)
        }
        .overlay {
            if let selectedBook, showDetailView {
                DetailView(show: $showDetailView, animation: animation, book: selectedBook)
                    .transition(.asymmetric(insertion: .identity, removal: .offset(y: 5)))
            }
        }
        .onChange(of: showDetailView) { newValue in
            if !newValue{
                withAnimation(.easeInOut(duration: 0.15).delay(0.3)){
                    animateCurrentBook = false
                }
            }
        }
    }
    
    func bottomPadding(_ size: CGSize = .zero) -> CGFloat{
        let cardHeight: CGFloat = 220
        let scrollViewHeight: CGFloat = size.height
        return scrollViewHeight - cardHeight - 40
    }
    
    @ViewBuilder
    func BookCardView(_ book: Article) -> some View{
        GeometryReader{
            let size = $0.size
            let rect = $0.frame(in: .named("SCROLLVIEW"))
            //            let minY = rect.minY
            HStack(spacing: -25){
                VStack(alignment: .leading, spacing: 6){
                    Text(book.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("By \(book.author)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    RatingView(rating: book.rating)
                        .padding(.top, 10)
                    Spacer(minLength: 10)
                    HStack(spacing: 4){
                        Text("\(book.articlViews)")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        Text("Views")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer(minLength: 0)
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(20)
                .frame(width: size.width / 2, height: size.height * 0.8)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.08), radius: 8, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.08), radius: 8, x: -5, y: -5)
                }
                .zIndex(1)
                .offset(x: animateCurrentBook && selectedBook?.id == book.id ? -20 : 0)
                //                .overlay(
                //                    Text("\(rect.minY)")
                //                )
                
                ZStack{
                    if !(showDetailView && selectedBook?.id == book.id){
                        Image(book.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width/2 ,height: size.height)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .matchedGeometryEffect(id: book.id, in: animation)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: size.width)
            .rotation3DEffect(.init(degrees: convertOffsetToRotation(rect)), axis: (x: 1, y: 0, z: 0), anchor: .bottom, anchorZ: 1, perspective: 0.8)
        }
        .frame(height: 220)
    }
    
    func convertOffsetToRotation(_ rect: CGRect) -> CGFloat {
        let cardHeight = rect.height + 20
        let minY = rect.minY - 20
        let progress = minY < 0 ? (minY / cardHeight) : 0
        let constrainedProgress = min(-progress, 1.0)
        return constrainedProgress * 90
    }
}

//struct ArticleView: View {
//    let articles: [Article] = Article.Articles
//    var body: some View {
//        NavigationStack {
//            List(articles) { article in
//                NavigationLink(destination: ArticleDetailView(article: article)) {
//                    CardViewForArticle(article: article)
//                }
//            }
//        }
//    }
//}
//
//
//#Preview {
//    ArticleView()
//}
