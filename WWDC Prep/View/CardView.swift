//
//  CardView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 9/2/2567 BE.
//

import SwiftUI

struct CardView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5, x: 0, y: 2)
            .padding(.horizontal)
    }
}

//#Preview {
//    CardView(text: "Hello")
//}
