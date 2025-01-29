//
//  ForEach.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct ForEachLoop: View {
    let data : [String] = ["hi","hello","Hey Everyone "]
    let myString : String = "Hello"
    
    var body: some View {
        VStack{
            ForEach(0..<10) { index in
                HStack{
                    Circle()
                        .frame(width: 30,height: 30)
                    Text("Hi: \(index)")
                }
            }
            
            
            ForEach(data.indices) { index in
                Text("\(data[index]) : \(index)")
            }
            

     
        }
    }
}

#Preview {
    ForEachLoop()
}
