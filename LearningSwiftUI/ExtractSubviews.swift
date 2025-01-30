//
//  ExtractSubviews.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct ExtractSubviews: View {
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            content
        }
        
    }
    
    var content : some View {
        HStack(){
            MyItem(title: "Apple", count: 10, color:.red)
            MyItem(title: "Oranges", count: 30, color:.orange)
            MyItem(title: "Bananas", count: 50, color:.yellow)
        }
    }
}

#Preview {
    ExtractSubviews()
}

struct MyItem: View {
    
    var title : String
    var count : Int
    var color : Color
    
    var body: some View {
        VStack{
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
