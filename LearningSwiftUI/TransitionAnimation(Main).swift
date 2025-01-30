//
//  TransitionAnimation.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct TransitionAnimation: View {
    @State var showView = false
    var body: some View {
        ZStack (alignment: .bottom){
            VStack{
                Button("Button"){
                    withAnimation(.easeInOut) { // Ensure animation wraps state change
                        showView.toggle()
                     }
                }
                Spacer()
            }
            if showView{
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                   // .transition(.move(edge: .leading))
                   // .transition(AnyTransition.opacity.animation(.easeInOut))
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
                
            }
           
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    TransitionAnimation()
}
