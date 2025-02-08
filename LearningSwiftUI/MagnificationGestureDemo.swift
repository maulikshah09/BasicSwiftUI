//
//  MegnificationGesture.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/8/25.
//

import SwiftUI

struct MagnificationGestureDemo: View {
    @State var currentAmount : CGFloat = 0
    @State var lastAmount = 0.0
    var body: some View {
        
        
        //example 2
        VStack(spacing: 10.0){
            HStack{
                Circle().frame(width: 35,height: 35)
                Text("Swiftful thinking")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged{ value in
                            currentAmount = value - 1
                        }.onEnded{ value in
                            withAnimation(.spring){
                                currentAmount = 0
                            }
                        }
                )
            HStack{
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("this is the caption for my photo")
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
        }
        
        
        //example 1
        
//        Text("Hello, World!")
//            .font(.title)
//            .padding(40)
//            .background(Color.red.cornerRadius(10))
//            .scaleEffect(1 + currentAmount + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged{ value in
//                        currentAmount = value - 1
//                    }
//                    .onEnded{ value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
          
    }
}

#Preview {
    MagnificationGestureDemo()
}
