//
//  BackgroundOverlay.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

struct BackgroundOverlay: View {
    var body: some View {
        Text("Hello, World!")
          
            .background(
                //Color.red
               // LinearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom)
                Circle()
                    .fill(LinearGradient(colors: [.red,.blue], startPoint: .leading, endPoint: .trailing))
                    .frame(width: 100,height: 100, alignment: .center)
            )
           
            .background(
                Circle()
                    .fill(LinearGradient(colors: [.blue,.red], startPoint: .leading, endPoint: .trailing))
                    .frame(width: 120,height: 120, alignment: .center)
            )
    }
}

#Preview {
    BackgroundOverlay()
}
