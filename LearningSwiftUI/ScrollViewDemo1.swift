//
//  ScrollView.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct ScrollViewDemo: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(.blue)
                        .frame(height: 300)
                }
            }
        }
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(.red)
                        .frame(width: 300)
                }
            }
        }
        
    }
}

#Preview {
    ScrollViewDemo()
}
