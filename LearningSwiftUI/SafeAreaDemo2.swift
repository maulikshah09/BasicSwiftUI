//
//  SafeAreaDemo2.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct SafeAreaDemo2: View {
    var body: some View {
        ScrollView{
            VStack {
                Text("Title goes here")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                ForEach(0..<10){ index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                        .frame(height:150)
                        .shadow(radius: 10)
                        .padding(20)
                }
            }
        }
        .background(.red)
        
    }
}

#Preview {
    SafeAreaDemo2()
}
