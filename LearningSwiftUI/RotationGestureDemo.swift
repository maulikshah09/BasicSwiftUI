//
//  RotationGestureDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/8/25.
//

import SwiftUI

struct RotationGestureDemo: View {
    @State var angle : Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(.blue)
            .cornerRadius(10)
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged{ value in
                        angle = value
                    }.onEnded{value  in
                        withAnimation {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureDemo()
}
