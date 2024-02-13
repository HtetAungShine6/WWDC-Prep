//
//  CustomAlertView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 13/2/2567 BE.
//

import SwiftUI

struct CustomAlertView: View {
    @Binding var show: Bool
   var body: some View {
       ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
           VStack(spacing: 25) {
               Image("Complete")
                   .resizable()
                   .frame(maxWidth: 190, maxHeight: 270)
                   .cornerRadius(25)
               Text("Congratulations")
                   .font(.title)
                   .foregroundColor(.pink)
               Text("You've Successfully Done The Work")
               Button(action: {
                   show = false
               }) {
                   Text("Back To Home")
                       .foregroundColor(.white)
                       .fontWeight(.bold)
                       .padding(.vertical, 10)
                       .padding(.horizontal, 25)
                       .background(Color.purple)
                       .clipShape(Capsule())
               }
           }
           .padding(.vertical, 25)
           .padding(.horizontal, 30)
           .background(BlurView())
           .cornerRadius(25)
       }
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(
           Color.primary.opacity(0.35)
       )
   }
}
//
//#Preview {
//    CustomAlertView()
//}
