//
//  ViewThatfitsDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/5/25.
//

import SwiftUI

struct ViewThatfitsDemo: View {
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            
            ViewThatFits(in: .horizontal){
                Text("This is some text that would like to display to the user!")
                Text("This is some text that would like to display!")
                Text("This is some text!")
            }
           
        }
        .frame(height: 300)
        .padding(80)
        .font(.headline)
    }
}

#Preview {
    ViewThatfitsDemo()
}
