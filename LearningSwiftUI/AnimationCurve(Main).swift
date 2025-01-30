//
//  AnimationCurve.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct AnimationCurve: View {
    @State var isAnimating = false
    
   // let timing = 10.0
    
    var body: some View {
        VStack{
            Button("Button") {
                isAnimating.toggle()
            }
            
            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50,
//                       height: 100)
//                .animation(.linear(duration: timing), value: isAnimating)
            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50,
//                       height: 100)
//                .animation(.easeIn(duration: timing), value: isAnimating)
//            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50,
//                       height: 100)
//                .animation(.easeInOut(duration: timing), value: isAnimating)
//            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50,
//                       height: 100)
//                .animation(.easeOut(duration: timing), value: isAnimating)
//
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50,
                       height: 100)
               // .animation(.spring, value: isAnimating)
                .animation(.spring(response: 0.5,
                                   dampingFraction: 0.7,blendDuration: 1.0), value: isAnimating)
        }
    }
}

#Preview {
    AnimationCurve()
}
