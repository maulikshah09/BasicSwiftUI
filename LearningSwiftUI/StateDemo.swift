//
//  State.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

// update view using this property

struct StateDemo: View {
    
    @State var backgroundColor: Color = .green
    @State var mytitle : String = "My Title"
    @State var count : Int = 0
    
    var body: some View {
        ZStack{
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(mytitle)
                    .font(.title)
                Text("Count : \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                 
                    Button ("Plus") {
                        backgroundColor = .orange
                        mytitle = "Plus  pressed"
                        count += 1
                    }
                    
                    Button("Minus"){
                        backgroundColor = .purple
                        mytitle = "Minus  pressed"
                        count -= 1
                        count = max(0, count) // max 0
                    }
                    
                }
            }.foregroundColor(.white)
        }
        
    }
}

#Preview {
    StateDemo()
}
