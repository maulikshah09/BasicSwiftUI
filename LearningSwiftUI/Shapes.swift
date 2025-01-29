//
//  Shapes.swift
//  SwiftUIDemo
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
       // Circle()
       // Ellipse()
       // Capsule(style: .circular)
       // Rectangle()
        RoundedRectangle(cornerRadius: 10)
           // .fill(Color.green)
           // .foregroundColor(.red)
            //.stroke()
            //.stroke(Color.red)
          //  .stroke(Color.red,lineWidth: 20)
            //.stroke(.orange, style: StrokeStyle(lineWidth: 20,lineCap: .butt,dash: [10]))
           // .stroke(.orange, style: StrokeStyle(lineWidth: 20,lineCap: .round,dash: [20]))
        
           // .trim(from: 0.0,to: 1.0) // 0 to 1.0 entire circle
//            .trim(from: 0.2,to: 1.0)
//            .stroke(Color.purple,lineWidth: 50)
            .frame(width: 300,height:200)
           
            
            
            
            
            
    }
}

#Preview {
    Shapes()
}
