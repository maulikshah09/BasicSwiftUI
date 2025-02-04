//
//  Popover.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct Popover: View {
    
    @State var showNewScreen = false
    
    
    var body: some View {
        ZStack{
            Color.orange
                .ignoresSafeArea()
            
            VStack{
                Button("Button") {
                    withAnimation(.spring) {
                        showNewScreen = true
                    }
                }.font(.largeTitle)
                Spacer()
            }
            // method 1 - sheet
//            .sheet(isPresented: $showNewScreen) {
//                NewScreen()
//            }
            
            //Method 2 - transition
            if showNewScreen{
                NewScreen(showNewScreen: $showNewScreen)
                    .padding(.top,100)
                    .transition(.move(edge: .bottom))
                
            }
            
            
            // Method 3 - Animation Offset
//            NewScreen(showNewScreen: $showNewScreen)
//                .padding(.top,100)
//                .offset(y : showNewScreen ? 0 : UIScreen.main.bounds.height)
//                .animation(.spring, value: showNewScreen)
            
            
        }
    }
}

 

struct NewScreen : View {
    
    @Binding var showNewScreen: Bool
   // @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.purple
                .ignoresSafeArea()
            
            Button {
                
                // method 1
                // presentationMode.wrappedValue.dismiss()
                
                // method 2
                withAnimation(.easeInOut(duration: 0.3)) { // Animate dismiss
                    showNewScreen.toggle()
                }
               
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }

        }
        .transition(.move(edge: .bottom))
    }
}

#Preview {
    Popover()
}
