//
//  TipsView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 8/2/2567 BE.
//

import SwiftUI

struct TipsView: View {
    let tips = Tip.sampleTips

    var body: some View {
        TabView {
            ForEach(tips) { tip in
                VStack {
                    Image(systemName: tip.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .foregroundColor(.green)
                    Text(tip.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(tip.detail)
                        .font(.body)
                        .padding()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    TipsView()
}
