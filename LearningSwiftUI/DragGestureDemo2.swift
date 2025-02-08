//
//  DragGestureDemo2.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/8/25.
//

import SwiftUI

struct DragGestureDemo2: View {
    @State var startingOffsetY : CGFloat = UIScreen.main.bounds.height * 0.82
    @State var currentDragOffsetY : CGFloat = 0
    @State var endingOffsetY : CGFloat = 0
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            MySignupView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged{value  in
                            withAnimation(.spring) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded{ value in
                            withAnimation(.spring) {
                                if currentDragOffsetY < -150 {
                                    endingOffsetY = -startingOffsetY
                                }
                                else if endingOffsetY != 0 && currentDragOffsetY > 150{
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        }
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGestureDemo2()
}

struct MySignupView: View {
    var body: some View {
        VStack(spacing: 20.0){
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.bottom,20)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
            
            Text("This is the description for our app. This is my favorite SWiftUI course and I recommend to all of my friends to subscribe to SWiftful Thinking!")
                .padding()
                .multilineTextAlignment(.center)
            
            Text("Create An Account")
                .foregroundStyle(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(.black)
                .cornerRadius(10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
    }
}
