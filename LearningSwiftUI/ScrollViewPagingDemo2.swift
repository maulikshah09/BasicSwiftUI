//
//  ScrollViewPagingDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/16/25.
//

import SwiftUI

@available(iOS 17, *)
struct ScrollViewPagingDemo2: View {
    @State private var scrollPosition: Int? = nil
    
    var body: some View {
        
        VStack{
            Button("Scroll to") {
                scrollPosition = (0..<20).randomElement()
            }
            
            ScrollView(.horizontal){
                HStack(spacing: 0) {
                    ForEach(0..<50){ index in
                        Rectangle()
                           
                            .frame(width: 300,height: 300)
                            .cornerRadius(10)
                            .overlay(
                                Text("\(index)")
                                    .foregroundStyle(.white)
                            )
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .id(index)
                            .scrollTransition(.interactive.threshold(.visible(0.9))) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.3)
                                    .offset(y:phase.isIdentity ? 0 :  -100)
                            }
                        
//                            .scrollTransition  { content, phase in
//                                content
//                                    .opacity(phase.isIdentity ? 1 : 0.3)
//                            }
                    }
                }
                .padding(.vertical,100)
            }
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .animation(.smooth,value : scrollPosition)
            .scrollBounceBehavior(.basedOnSize) // if less data not bounce
            
        }
       
    
    }
}

@available(iOS 17, *)
#Preview {
    ScrollViewPagingDemo2()
}
