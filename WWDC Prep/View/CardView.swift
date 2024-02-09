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
            .padding()
            .foregroundColor(.black)
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            .shadow(radius: 5)
            .frame(maxWidth: .infinity, maxHeight: 500, alignment: .leading)
            .padding(.horizontal)
    }
}
#Preview {
    CardView(text: "Hello")
}
