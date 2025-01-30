//
//  LazyVGrid.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct GridItemsFixed: View {
    
    let columns: [GridItem] = [
        GridItem(.fixed(50), spacing: nil, alignment: nil),
        GridItem(.fixed(75), spacing: nil, alignment: nil),
        GridItem(.fixed(100), spacing: nil, alignment: nil),
        GridItem(.fixed(75), spacing: nil, alignment: nil),
        GridItem(.fixed(50), spacing: nil, alignment: nil)
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
    GridItemsFixed()
}
