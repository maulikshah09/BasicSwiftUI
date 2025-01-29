//
//  Colors.swift
//  SwiftUIDemo
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

struct Colors: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            //.fill(Color.red.gradient)
            .fill(
                //Color.red.gradient
                Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
            )
            .frame(width: 300,height: 200)
            .shadow(color: .yellow.opacity(0.3),radius:10,x: -10 ,y: -20)
           
    }
}

#Preview {
    Colors()
}
