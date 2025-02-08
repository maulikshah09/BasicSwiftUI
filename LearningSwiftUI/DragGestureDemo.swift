//
//  DragGestureDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/8/25.
//

import SwiftUI

struct DragGestureDemo: View {
    @State var offset : CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack{
                Text("\(offset.width)")
                Spacer()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300,height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotateionAmount()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation (.spring){
                                offset = value.translation
                            }
                        }.onEnded{ value  in
                            withAnimation (.spring){
                                offset = .zero
                            }
                        }
                )
        }
    }
    
    func getScaleAmount() -> CGFloat{
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let pecentage = currentAmount / max
        return 1.0 - min(pecentage,0.5) * 0.5
    }
    
    func getRotateionAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentAge = currentAmount / max
        let percentageAsDouble = Double(percentAge)
        let maxAngle: Double = 10
        return percentageAsDouble * maxAngle
    }
}

#Preview {
    DragGestureDemo()
}
