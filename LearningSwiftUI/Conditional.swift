//
//  Conditional.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct Conditional: View {
    @State var showCircle : Bool = false
    @State var showRectangle : Bool = false
    
    var body: some View {
        VStack(spacing: 20){
           
            Button("Circle button : \(showCircle.description)") {
                showCircle.toggle()
            }
            
            Button("Rectangle button : \(showRectangle.description)") {
                showRectangle.toggle()
            }
            
            if showCircle {
                Circle()
                    .frame(width: 100,height: 100)
            }
            
            if showRectangle {
                Rectangle()
                    .frame(width: 100,height: 100)
            }
            
            if showCircle && showRectangle{
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 200,height: 100)
            }
            
            Spacer()
        }
    }
}

#Preview {
    Conditional()
}
