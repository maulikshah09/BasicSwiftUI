//
//  Images.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

struct Images: View {
    var body: some View {
        Image("therock")
            .resizable()
            //.aspectRatio(contentMode: .fit)
            //.scaledToFit()
            .scaledToFill()
           // .foregroundColor(.red) // only work transpernet background. for color change.
            .frame(width: 300, height: 200)
            // .clipped()
            // .cornerRadius(150)
           // .clipShape(
                //Circle()
                //RoundedRectangle(cornerRadius: 25.0)
             //   Ellipse()
            //)
    }
}

#Preview {
    Images()
}
