//
//  VisualEffectDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/14/25.
//

import SwiftUI

@available(iOS 17, *)
struct VisualEffectDemo: View {
    var body: some View {
         
            
        ScrollView {
            VStack(spacing: 30){
                ForEach(0..<100){ index in
                    Rectangle()
                        .frame(width: 300,height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.orange)
                        .visualEffect { content, geometry in
                            content
                                .offset(x: geometry.frame(in: .global).minY * 0.05)
                        }
                }
            }
        }
        
    }
}

@available(iOS 17, *)
#Preview {
    VisualEffectDemo()
}
