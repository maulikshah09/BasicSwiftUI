//
//  Gradient.swift
//  SwiftUIDemo
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

struct Gradient: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                LinearGradient(
//                    colors: [.orange,.white, .green],
//                    startPoint: .top,
//                    endPoint: .bottom)
                
                RadialGradient(colors: [.red,.blue], center: .leading, startRadius: 5, endRadius: 400)
                
                //  AngularGradient(colors:  [.red,.blue], center: .topLeading, angle:  .degrees (180 + 45))
            
            )
            .frame(width: 300, height: 200)
            
    }
}

#Preview {
    Gradient()
}
