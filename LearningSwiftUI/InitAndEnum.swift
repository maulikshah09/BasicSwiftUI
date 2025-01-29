//
//  InitEnum.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct Init: View {
    let backgroundColor: Color
    let count : Int
    let title : String
    
    // it is doing in background like below. switui very smart so we don't have to write below code.
    
//    init(backgroundColor: Color, count: Int, title: String) {
//        self.backgroundColor = backgroundColor
//        self.count = count
//        self.title = title
//    }
    
    
    
    
    // but if you want to do some operation then you have to write. check below example.
    
    init( count: Int, fruit: Fruit) {
        self.count = count
        self.title = fruit == .apple ? "Apple" : "Orange"
        self.backgroundColor = fruit  == .apple ? .red : .orange
    }
    
    enum Fruit {
        case apple
        case orange
    }
    
    var body: some View {
        VStack(spacing: 12){
            Text("\(count)")
                .font(.largeTitle)
                .underline()
            
            Text("\(title)")
                .font(.headline)
        }
        .foregroundColor(.white)
        .frame(width: 150,height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

#Preview {
    HStack{
        Init(count: 100, fruit: .apple)
        Init(count: 50, fruit: .orange)
    }
}
