//
//  DetailView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 10/2/2567 BE.
//

import SwiftUI

struct DetailView: View {
    @Binding var show: Bool
    var animation: Namespace.ID
    var book: Article
    @State private var animationContent: Bool = false
    @State private var offsetAnimation: Bool = false
    var body: some View {
        VStack(spacing: 15){
            Button{
                withAnimation(.easeInOut(duration: 0.2)){
                    offsetAnimation = false
                }
                withAnimation(.easeInOut(duration: 0.35).delay(0.1)){
                    animationContent = false
                    show = false
                }
            }label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .contentShape(Rectangle())
            }
            .padding([.leading, .vertical], 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .opacity(animationContent ? 1 : 0)
            GeometryReader{
                let size = $0.size
                HStack(spacing: 20){
                    Image(book.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: (size.width - 30)/2, height: size.height)
                        .clipShape(CustomCorners(corners: [.topRight, .bottomRight], radius: 20))
                        .matchedGeometryEffect(id: book.id, in: animation)
                    VStack(alignment: .leading, spacing: 8){
                        Text(book.title)
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("By \(book.author)")
                            .font(.callout)
                            .foregroundColor(.gray)
                        RatingView(rating: book.rating)
                    }
                    .padding(.trailing, 15)
                    .padding(.top, 30)
                    .offset(y: offsetAnimation ? 0 : 100)
                    .opacity(offsetAnimation ? 1 : 0)
                }
            }
            .frame(height: 220)
            .zIndex(1)
            Rectangle()
                .fill(.gray.opacity(0.04))
                .ignoresSafeArea()
                .overlay(alignment: .top, content: {
                    BookDetails()
                })
                .padding(.leading, 30)
                .padding(.top, -180)
                .zIndex(0)
                .opacity(animationContent ? 1 : 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background{
            Rectangle()
                .fill(.white)
                .ignoresSafeArea()
                .opacity(animationContent ? 1 : 0)
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 0.35)){
                animationContent = true
            }
            withAnimation(.easeInOut(duration: 0.35).delay(0.1)){
                offsetAnimation = true
            }
        }
    }
    @ViewBuilder
    func BookDetails() -> some View{
        VStack(spacing: 0){
//            HStack(spacing: 0){
//                Button{
//                    
//                }label: {
//                    Label("Reviews", systemImage: "text.alignleft")
//                        .font(.callout)
//                        .foregroundColor(.gray)
//                }
//                .frame(maxWidth: .infinity)
//                Button{
//                    
//                }label: {
//                    Label("Like", systemImage: "suit.heart")
//                        .font(.callout)
//                        .foregroundColor(.gray)
//                }
//                .frame(maxWidth: .infinity)
//                Button{
//                    
//                }label: {
//                    Label("Share", systemImage: "square.and.arrow.up")
//                        .font(.callout)
//                        .foregroundColor(.gray)
//                }
//                .frame(maxWidth: .infinity)
//            }
            Divider()
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 15){
                    Text("About the article")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(book.about)
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 15)
                .padding(.top, 20)
            }
            Button{
                
            }label: {
                Text("Read Now")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background{
                        Capsule()
                            .fill(Color.blue.gradient)
                    }
                    .foregroundColor(.white)
            }
        }
        .padding(.top, 180)
        .padding([.horizontal, .top], 15)
        .offset(y: offsetAnimation ? 0 : 100)
        .opacity(offsetAnimation ? 1 : 0)
    }
}
//
//#Preview {
//    ArticleView()
//}
