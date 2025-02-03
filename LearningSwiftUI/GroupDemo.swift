//
//  GroupDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/4/25.
//

import SwiftUI

struct GroupDemo: View {
    var body: some View {
        VStack(spacing: 50){
            Text("Hello, World!")
           
            Group() {
                Text("Hello, World!")
                Text("Hello, World!")

            }
            .font(.caption)
            .foregroundStyle(.green)
           
            
        }
        .foregroundStyle(.red)
        .font(.headline)
      
    }
}

#Preview {
    GroupDemo()
}
