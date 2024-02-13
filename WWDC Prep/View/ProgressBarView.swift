//
//  ProgressBarView.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 9/2/2567 BE.
//

import SwiftUI

struct ProgressBarView: View {
    var value: CGFloat

    var progressColor: Color {
        switch value {
        case 0..<0.26:
            return .red
        case 0.26..<0.66:
            return .yellow
        case 0.6..<0.76:
            return .mint
        case 0.76...1.0:
            return .green
        default:
            return .gray
        }
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                    .cornerRadius(geometry.size.height / 2)

                Rectangle()
                    .frame(width: min(value * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(progressColor)
                    .cornerRadius(geometry.size.height / 2)
                    .animation(.linear(duration: 0.5), value: value)
                
                HStack {
                    Spacer()
                    Text("\(Int(value * 100))%")
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                }
            }
        }
    }
}


//struct ProgressBarView: View {
//    var value: CGFloat
//
//    var progressColor: Color {
//        switch value {
//        case 0..<0.26:
//            return .red
//        case 0.26..<0.66:
//            return .yellow
//        case 0.6..<0.76:
//            return .mint
//        case 0.76...1.0:
//            return .green
//        default:
//            return .gray
//        }
//    }
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .leading) {
//                Rectangle()
//                    .frame(width: geometry.size.width, height: geometry.size.height)
//                    .opacity(0.3)
//                    .foregroundColor(Color.gray)
//                    .cornerRadius(geometry.size.height / 2)
//
//                Rectangle()
//                    .frame(width: min(value * geometry.size.width, geometry.size.width), height: geometry.size.height)
//                    .foregroundColor(progressColor)
//                    .cornerRadius(geometry.size.height / 2)
//                    .animation(.linear(duration: 0.5), value: value)
//                
//                HStack {
//                    Spacer()
//                    Text("\(Int(value * 100))%")
//                        .bold()
//                        .foregroundColor(.white)
//                    Spacer()
//                }
//            }
//        }
//        .frame(height: 20)
//    }
//}

#Preview {
    ProgressBarView(value: 0.4)
}
