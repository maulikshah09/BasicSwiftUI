//
//  MaskDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/9/25.
//

import SwiftUI

struct MaskDemo: View {
    @State var rating = 0
    
    var body: some View {
        ZStack {
            starView
                .overlay(overlayView.mask(starView))
        }
    }
    
    private var overlayView : some View {
        GeometryReader{ geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                   // .foregroundStyle(.yellow)
                    .fill(LinearGradient(colors: [.red,.blue], startPoint: .leading, endPoint: .trailing))
                
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
                
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starView : some View {
        HStack (spacing: 8) {
            ForEach(1..<6) {index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                      
                    }
            }
        }
    }
}

#Preview {
    MaskDemo()
}
