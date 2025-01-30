//
//  LazyVGrid.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct GridItemFlexible: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<50) { item in
                Rectangle()
                    .frame(height: 50)
                
            }
           
        }
    }
}

#Preview {
    GridItemFlexible()
}
