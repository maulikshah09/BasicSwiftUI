//
//  List.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/31/25.
//

import SwiftUI

struct ListDemo: View {
    @State var fruits: [String] = ["Apples", "Bananas", "Oranges","peach"]
    
    @State var veggies: [String] = ["Carrots", "Broccoli", "Spinach"]
   
    var body: some View {
        
        NavigationStack{
            List {
                
                Section(header:
                    HStack{
                        Text("Fruits")
                        Image(systemName: "flame.fill")
                    }
                    .font(.headline)
                    .foregroundColor(.orange)) {
                    ForEach(fruits,id: \.self){ fruit in
                        Text(fruit)
                            .font(.caption)
                            .foregroundStyle(.white)
                            .padding(.vertical)
                    }
                  
                    // first way
    //                .onDelete { indexset in
    //                    delete(indexSet: indexset)
    //                }
                    
                    //second way
                    .onDelete(perform: delete)
                    
                    
                    // firstWay
//                    .onMove { indices, newoffset in
//                      
//                        fruits.move(fromOffsets: indices, toOffset: newoffset)
//                    }
//
                    //Second way
                    .onMove(perform: move)
                }
                .listRowBackground(Color.yellow)
                
                Section(header: Text("Vegitables")) {
                    ForEach(veggies,id: \.self){ veggies in
                        Text(veggies)
                    }
                }
                
            }
            .tint(.yellow)
            //.listStyle(PlainListStyle())
           // .listStyle(DefaultListStyle())
           // .listStyle(GroupedListStyle())
          //.listStyle(InsetGroupedListStyle())
            //.listStyle(SidebarListStyle())

            
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    addButton
                }
            }
        }
        .tint(.red)
    }
    
    var addButton : some View{
        Button("Add"){
            fruits.append("coconut")
        }
    }
   
    func move(indices: IndexSet, newoffSet: Int){
        fruits.move(fromOffsets:indices, toOffset: newoffSet)
    }
    
    func delete(indexSet : IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
}

#Preview {
    ListDemo()
}
