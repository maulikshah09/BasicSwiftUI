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
    
    var body: some View {
        Stepper("Stepper : \(stepperValue)",value: $stepperValue,in: 0...Int.max)
            .padding(50)
        
        Stepper("Stepper : \(steppertwoValue)",value: $steppertwoValue)
            .onChange(of: steppertwoValue) { newValue in
                steppertwoValue = max(newValue, 0)
            }
            .padding(50)
    }
}

#Preview {
    StepperDemo()
}
