//
//  Segment.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

import SwiftUI

struct SegmentedControlView: View {
    @Binding var selectedIndex: Int
    var options: [String]
    
    var backgroundColor : Color = .black
    var selectedbackgroundColor : Color = .white
    var selectedforgroundColor : Color = .black
    var unSelectedforgroundColor : Color = .black
    
    var font = Font.system(size: 16, weight: .medium, design: .serif)
   
    // Private constants for minimum and maximum values
    private let minFrameHeight: CGFloat = 30.0
    private let maxFrameHeight: CGFloat = 55.0
    private let minCornerRadius: CGFloat = 4.0
    private let maxCornerRadius: CGFloat = 20.0
    
    // Customizable properties with clamped values
    var frameHeight: CGFloat = 45.0 {
        didSet {
            frameHeight = min(max(frameHeight, minFrameHeight), maxFrameHeight)
        }
    }
    
    let cornerRadius = 8.0
    
    // Custom initializer to clamp the initial frameHeight value
    init(selectedIndex: Binding<Int>, options: [String], frameHeight: CGFloat = 45.0) {
        self._selectedIndex = selectedIndex
        self.options = options
        self.frameHeight = min(max(frameHeight, minFrameHeight), maxFrameHeight)
    }
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                Rectangle()
                    .fill(backgroundColor.opacity(0.2))
                
                Rectangle()
                    .fill(selectedbackgroundColor)
                    .cornerRadius(cornerRadius)
                    .padding(2)
                   
                    .frame(width: geometry.size.width / CGFloat(options.count), height: frameHeight - 1.0)
                    .offset(x: CGFloat(selectedIndex) * (geometry.size.width / CGFloat(options.count)), y: 0)
                    .animation(.easeInOut(duration: 0.3), value: selectedIndex)
                    
 
                
                HStack() {
                    ForEach(0..<options.count, id: \.self) { index in
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                selectedIndex = index
                            }
                        }) {
                            
                            Text(options[index])
                                .font(font)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .padding(.horizontal,4)
                                .foregroundColor(selectedIndex == index ? selectedforgroundColor : unSelectedforgroundColor)
                        }
                    }
                }
            }
            .cornerRadius(cornerRadius)
        }
        .frame(height: frameHeight)
       
    }
}

 
 
 

struct ContentView: View {
    @State private var selectedIndex: Int = 0
    let options = ["Option 1", "Option 2", "Option 3","Option 4"]

    var body: some View {
        VStack {
            SegmentedControlView(selectedIndex: $selectedIndex, options: options,frameHeight: 100)
                .padding()
            Text("Selected Option: \(options[selectedIndex])")
                .font(.headline)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
