//
//  Padding.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

struct Padding: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Hello, World!")
                .background(.yellow)
                .padding(.all,10)
                .padding(.leading, 20)
                .background(.blue)
                .padding(.leading,10)
            
            Text("Hello, Apple!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(.red)
                .padding(.leading,20)
            
            Text("This is the description of what we will do on the screen.It is multiple line and we will align text to leading edge")
                
               
        }
        .padding()
        .padding(.vertical,50)
        .background(
            Color.white
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 10,x: 0.0,y:10.0)
        )
        .padding()
        .background(.red)
        .padding(.horizontal)
        .background(.green)

        
    }
}

#Preview {
    Padding()
}
