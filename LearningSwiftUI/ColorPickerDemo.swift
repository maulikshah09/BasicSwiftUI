//
//  ColorPicker.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/31/25.
//

import SwiftUI

struct ColorPickerDemo: View {
    @State var backgroudColor : Color = .green
    @State var showColorPicker = false
    var body: some View {
        ZStack {
            backgroudColor
                .ignoresSafeArea()
            
            ColorPicker(selection: $backgroudColor, supportsOpacity: true) {
                Text("Pick a color")
                    .foregroundStyle(.white)
                    .font(.headline)
            }
            .padding(10)
            .background(.black)
            .cornerRadius(10)
            .padding(50)
            .onTapGesture {
                showColorPicker.toggle()
            }
        }
    }
}

#Preview {
    ColorPickerDemo()
}
