//
//  HashableDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/10/25.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title : String
    
    // if you don't want to use id or identifiable then use hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableDemo: View {
    //first
//    let data : [String] = [
//        "One","Two","Three","Four","Five"
//    ]
    
    //second
    let data : [MyCustomModel] = [
        MyCustomModel(title: "One"),
        MyCustomModel(title: "Two"),
        MyCustomModel(title: "Three"),
        MyCustomModel(title: "Four"),
        MyCustomModel(title: "Five")
    ]
    
    var body: some View {
        ScrollView{
            VStack(spacing: 40){
                ForEach(data,id: \.self) { item  in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableDemo()
}
