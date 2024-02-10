//
//  CustomCorners.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 10/2/2567 BE.
//

import SwiftUI

struct CustomCorners: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
