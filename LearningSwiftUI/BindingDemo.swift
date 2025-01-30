//
//  Binding.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct BindingDemo: View {
   // @Binding var count: Int
    
    @State var backgroundColor: Color = .green
    @State var title : String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            
            VStack {
                Text(title)
                ButtonView(backgroundColor: $backgroundColor, title: $title)
                
                Button  {
                    backgroundColor = .yellow
                    title = "My new title"
                } label: {
                    Text ("Press me to recover")
                        .foregroundColor(.white)
                        .padding()
                        .background(.purple)
                        .cornerRadius(12)
                }

            }
        }
    }
}

#Preview {
    BindingDemo()
}

struct ButtonView: View {
    @Binding var backgroundColor: Color
    @State var buttonColor : Color = .blue
    @Binding var title : String
    
    var body: some View {
        Button {
            backgroundColor = .orange
            buttonColor = .pink
            title = "New title"
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal,10)
                .background(buttonColor)
                .cornerRadius(10)
        }
    }
}
