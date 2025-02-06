//
//  NavigationSplitViewDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/5/25.
//

import SwiftUI

//mostly use -> iPad,MacOS, VisionOS

struct NavigationSplitViewDemo: View {
    
    @State private var visibility:NavigationSplitViewVisibility = .all //.doubleColumn //.detailOnly
    
    @State private var selectedCategory:FoodCategory? = nil
    
    @State private var selectedFood :Fruit? = nil
    
    //.automatic
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility){
            
            List(FoodCategory.allCases,id: \.rawValue,selection: $selectedCategory) {categoy in
                    Button(categoy.rawValue.capitalized){
                        selectedCategory = categoy
                    }
                
                //navigation link also u can use.
            }
            
            // not work in iPhone
//            List {
//                ForEach(FoodCategory.allCases,id : \.rawValue){ categoy in
//                    Button(categoy.rawValue.capitalized){
//                        selectedCategory = categoy
//                    }
//                }
//            }
            .navigationTitle("Categories")
        } content: {
            Group{
                if let selectedCategory{
                    switch selectedCategory {
                    case .fruits:
//                        List {
//                            ForEach(Fruit.allCases,id : \.rawValue){ fruit in
//                                Button(fruit.rawValue.capitalized){
//                                    selectedFood = fruit
//                                }
//                            }
//                        }
                        
                        List(Fruit.allCases,id: \.rawValue,selection: $selectedFood) {fruit in
                            Button(fruit.rawValue.capitalized){
                                selectedFood = fruit
                            }
                        }
                    case .vegetables:
                        EmptyView()
                    case .meats:
                        EmptyView()
                    }
                }else{
                    Text("Select a category to begin")
                }
            }
            .navigationTitle(selectedCategory?.rawValue.capitalized ?? "")
           
        } detail: {
            if let selectedFood{
                Text("you selected \(selectedFood.rawValue)")
                    .font(.largeTitle)
                    .navigationTitle(selectedFood.rawValue.capitalized)
            }else{
                Text("Select Somthing")
            }
           
        }
        .navigationSplitViewStyle(
            //.prominentDetail
            .balanced
        )
        
        
//        NavigationSplitView {
//            Color.red
//        } content: {
//            Color.blue
//        } detail: {
//            Color.green
//        }
//
//        
        
//        NavigationSplitView {
//            Color.red
//        } detail: {
//            Color.blue
//        }

    }
}

#Preview {
    NavigationSplitViewDemo()
}


enum FoodCategory: String,CaseIterable {
    case fruits
    case vegetables
    case meats
}

enum Fruit: String,CaseIterable{
    case apple,banana,orange
}
