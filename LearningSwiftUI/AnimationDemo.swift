//
//  Animation.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct AnimationDemo: View {
    @State var isAnimated = false
    
    var body: some View {
        VStack {
            Button("Animate View") {
                withAnimation(
                    Animation
                        .default
                        .repeatCount(10,
                                autoreverses: true)){
                    isAnimated.toggle()
                }
                   
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? .red : .green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 :300)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
//                .animation(.default
//                           .repeatForever()
//                           , value: isAnimated)
                
                 
            Spacer()
        }
    }
}

#Preview {
    AnimationDemo()
}
