//
//  MakeCommonViews.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct ExtractedFunctions: View {
    
    @State var backgroundColor: Color = .pink
    
    var body: some View {
        ZStack{
            // backgroud
            backgroundColor.ignoresSafeArea()
          
            //content
            contentLayer
        }
    }
    
    // so many UI then make something like this.
    
    /// if it static then it is ok otherwise extract subview you have to do. neext chepter
    var contentLayer : some View{
        VStack{
            Text("Title")
                .font(.largeTitle)
            
            Button {
                buttonPress()
            } label: {
                Text("Press Me")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                   
            }

        }
    }
    
    func buttonPress () { // if so many logic then make func and work here and call.
        backgroundColor = .yellow
    }
}

#Preview {
    ExtractedFunctions()
}
