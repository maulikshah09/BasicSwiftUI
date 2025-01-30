//
//  safeArea.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct SafeArea: View {
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            
            VStack{
                Text("Hello, World!")
                Spacer()
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.red,ignoresSafeAreaEdges: [])
        }
    }
}

#Preview {
    SafeArea()
}
