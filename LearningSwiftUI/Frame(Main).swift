//
//  Frame.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

//this one help you to debug

struct Frame: View {
    var body: some View {
        Text("Hello, World!")
            .background(.green) // for text
 //           .frame(width: 300,height: 300,alignment: .leading)
            .frame(height: 100,alignment: .top)
            .background(.red) // for frame
            .frame(width: 150)
            .background(.purple)
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(.pink)
            .frame(height: 400)
            .background(.green)
            .frame(maxHeight: .infinity,alignment: .top)
            .background(.yellow)
            
    }
}

#Preview {
    Frame()
}
