//
//  GeometryRaderDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/9/25.
//

import SwiftUI

// not use geometryreader if need then use other wise it slow the ui

struct GeometryRaderDemo: View {
    var body: some View {
        GeometryReader{ geomertry in
            HStack(spacing: 0.0) {
                Rectangle()
                    .fill(.red)
                    .frame(width: geomertry.size.width * 0.666)
                
                Rectangle()
                    .fill(.blue)
            }
            .ignoresSafeArea()
        }
       
    }
}

#Preview {
    GeometryRaderDemo()
}
