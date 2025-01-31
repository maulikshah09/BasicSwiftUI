//
//  Stepper.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

struct StepperDemo: View {
    
    @State private var stepperValue = 0
    @State private var steppertwoValue = 0
    @State var widthIncrement: CGFloat = 0.0
    
    var body: some View {
        Stepper("Stepper : \(stepperValue)",value: $stepperValue,in: 0...Int.max)
            .padding(50)
        
        Stepper("Stepper 2 : \(steppertwoValue)",value: $steppertwoValue)
            .onChange(of: steppertwoValue) { newValue in
                steppertwoValue = max(newValue, 0)
            }
            .padding(50)
        
        
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 100 + CGFloat(widthIncrement),height: 100)
        
        Stepper("Stepper 2") {
            incrementWidth(amount: 10.0)
        } onDecrement: {
            incrementWidth(amount: -10.0)
        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement =  max(0, widthIncrement) + amount
           
        }
    }
}

#Preview {
    StepperDemo()
}
