//
//  NavigationStack.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/31/25.
//

import SwiftUI

// It is from iOS 16

struct NavigationStackDemo: View {
    let fruits = ["Apples", "Bananas", "Oranges", "Pineapple"]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 40){
                    ForEach(fruits, id: \.self) { fruit in
                        
                        // Not direct way it call navigation destination
                        NavigationLink(value: fruit){
                            Text(fruit)
                        }
                        
                        
                        
                        // Direct way
//                        NavigationLink(fruit){
//                            Text("Another screen \(fruit)")
//                        }
                    }
                    
                    ForEach(0..<10) { x in
//                        NavigationLink(value: x) {
//                            Text("Click Me : \(x)")
//                        }
                        
                        NavigationLink("Click Me : \(x)") {
                            MySecondScreen(value: x)
                        }
                    }
                }
            }
            
            
            .navigationTitle("Navigation Stack")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationDestination(for: Int.self) { value in
                MySecondScreen(value: value)
            }
             .navigationDestination(for: String.self) { value in
                Text("Another screen \(value)")
            }
        }
       
    }
}

struct MySecondScreen:View {
    let value : Int
    
    init(value: Int) {
        self.value = value
        print("Init screen: \(value)")
    }
    
     var body: some View {
        Text("Second Screen \(value)")
    }
}

#Preview {
    NavigationStackDemo()
}
