//
//  HapticsDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/9/25.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    func notification (type : UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style : UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

// check in your iphone 

struct HapticsDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Success"){HapticManager.instance.notification(type: .success)}
            
            Button("warning"){HapticManager.instance.notification(type: .warning)}
            
            Button("error"){HapticManager.instance.notification(type: .error)}
            Divider()
            
            Button("soft"){
                HapticManager.instance.impact(style: .soft)
            }
            Button("light"){
                HapticManager.instance.impact(style: .light)
            }
            Button("medium"){
                HapticManager.instance.impact(style: .medium)
            }
            Button("rigid"){
                HapticManager.instance.impact(style: .rigid)
            }
            Button("heavy"){
                HapticManager.instance.impact(style: .heavy)
            }
        }
    }
}

#Preview {
    HapticsDemo()
}
