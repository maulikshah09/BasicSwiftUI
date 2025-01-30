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
        VStack(spacing: 20){

             VStack (spacing: 8){
                 ForEach(0..<10) { index in
                     HStack{
                         Circle()
                             .frame(width: 30,height: 30)
                         Text("Hi: \(index)")
                     }
                 }
             }
           
            
            
            VStack (spacing: 8){
                ForEach(data.indices,id: \.self) { index in
                    Text("\(data[index]) : \(index)")
                }
            }
            
            VStack (spacing: 8){
                ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                    Text("\(value) : \(index)")
                }
                
            }
            
        }
    }
}

#Preview {
    ForEachLoop()
}
