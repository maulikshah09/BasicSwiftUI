//
//  ScrollViewPagingDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/16/25.
//

import SwiftUI

@available(iOS 17, *)
struct ScrollViewPagingDemo: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 0) {
                ForEach(0..<50){ index in
                    Rectangle()
                       
                      //  .frame(width: 300,height: 300)
                        .overlay(
                            Text("\(index)")
                                .foregroundStyle(.white)
                        )
                        .frame(maxWidth: .infinity)
                       // .padding(.vertical,10)
                        .containerRelativeFrame(.vertical,alignment: .center)
                }
            }
        }
        .ignoresSafeArea()
        .scrollTargetLayout()
       // .scrollTargetBehavior(.viewAligned)
        .scrollTargetBehavior(.paging)
        
        //.scrollBounceBehavior(.basedOnSize) // if less data not bounce
        
        .scrollBounceBehavior(.always)
    
    }
}

@available(iOS 17, *)
#Preview {
    ScrollViewPagingDemo()
}
