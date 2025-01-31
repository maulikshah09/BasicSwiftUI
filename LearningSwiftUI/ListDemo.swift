//
//  List.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/31/25.
//

import SwiftUI

struct ListDemo: View {
    @State var fruits: [String] = ["Apples", "Bananas", "Oranges","peach"]
   
    var body: some View {
        
         
            List {
                
                Section(header: Text("Fruits")) {
                    ForEach(fruits,id: \.self){ fruit in
                        Text(fruit)
                    }
                    
                    // first way
    //                .onDelete { indexset in
    //                    delete(indexSet: indexset)
    //                }
                    
                    //second way
                    .onDelete(perform: delete)
                }
                
                Section(header: Text("Vegitables")) {
                    ForEach(fruits,id: \.self){ fruit in
                        Text(fruit)
                    }
                }
                
            }
            .listStyle(.plain)
            
            .navigationTitle("Grocery List")
            
        }
   
    
    func delete(indexSet : IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
}

#Preview {
    ListDemo()
}
