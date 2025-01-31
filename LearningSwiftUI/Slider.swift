//
//  Slider.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

struct SliderDemo: View {
    @State var sliderValue : Double = 3
    @State var color: Color = .red
    var body: some View {
         
        VStack {
            Text("Rating")
            Text(
                String(format: "%.0f", sliderValue)
                )
            .foregroundStyle(color)
            .font(.largeTitle)
            .bold()
            
            // more spacific with syntex
            Slider(value: $sliderValue,
                   in: 1...5,
                   step: 1.0,
                   onEditingChanged: { (_) in
                        color = .green
                    },
                   minimumValueLabel: Text("1"),
                   maximumValueLabel: Text("5"),
                   label: {
                        Text("Title")
                    }
                  )
                .tint(.green)
                .foregroundStyle(.brown)
                .font(.largeTitle)
                .bold()
                .padding()
        }
    }
}

#Preview {
    SliderDemo()
}
