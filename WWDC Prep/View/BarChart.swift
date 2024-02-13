//
//  BarChart.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 13/2/2567 BE.
//

import SwiftUI
import Charts

struct BarChart: View {
    var body: some View {
        Chart{
            BarMark(x: .value("Type", "bird"), y: .value("Population", 1))
            BarMark(x: .value("Type", "dog"), y: .value("Population", 2))
            BarMark(x: .value("Type", "cat"), y: .value("Population", 3))
        }
        .aspectRatio(contentMode: .fit)
        .padding()
    }
}

#Preview {
    BarChart()
}
