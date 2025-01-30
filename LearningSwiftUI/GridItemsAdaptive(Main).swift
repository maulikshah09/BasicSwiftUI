//
//  LazyVGrid.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct GridItemsAdaptive: View {
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 50, maximum: 300), spacing: nil, alignment: nil),
        GridItem(.adaptive(minimum: 150, maximum: 300), spacing: nil, alignment: nil),

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
    GridItemsAdaptive()
}
