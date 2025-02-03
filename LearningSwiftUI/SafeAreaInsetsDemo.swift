//
//  SafeAreaInsetsDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/4/25.
//

import SwiftUI

struct SafeAreaInsetsDemo: View {
    var body: some View {
        NavigationStack{
            List(0..<10){_ in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle("Safe Area Insets")
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .top,alignment: .trailing) {
                Text("HI")
                    .frame(maxWidth: .infinity)
                    // .padding()
                    .background(.yellow)
                   // .clipShape(Circle())
                   // .padding()
            }
            
            .safeAreaInset(edge: .bottom,alignment: .trailing) {
                Text("HI")
                    .frame(maxWidth: .infinity)
                    // .padding()
                    .background(.yellow)
                   // .clipShape(Circle())
                   // .padding()
            }
            
//            .overlay(
//                Text("HI")
//                    .frame(maxWidth: .infinity)
//                    .background(.yellow)
//                ,alignment: .bottom
//            )
        }
    }
}

#Preview {
    SafeAreaInsetsDemo()
}
