//
//  BlurView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 13/2/2567 BE.
//

import SwiftUI
struct BlurView: UIViewRepresentable {
   func makeUIView(context: Context) -> some UIVisualEffectView {
       let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
       return view
   }
   func updateUIView(_ uiView: UIViewType, context: Context) {
//       print("Hey")
   }
}

#Preview {
    BlurView()
}
