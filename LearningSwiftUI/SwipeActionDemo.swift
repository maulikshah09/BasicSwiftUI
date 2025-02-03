//
//  SwipeActionDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/4/25.
//

import SwiftUI

struct SwipeActionDemo: View {
    @State var fruits: [String] = ["Apples", "Bananas", "Oranges","peach"]
    
    
    var body: some View {
        List{
            ForEach(fruits,id: \.self) {
                Text($0.capitalized)
                    .swipeActions(edge: .leading,allowsFullSwipe: false) {
                        Button("Share") {
                            
                        }
                        .tint(.yellow)
                    }
                    
                    .swipeActions(edge: .trailing,allowsFullSwipe: true) {
                        Button("Archive") {
                            
                        }
                        .tint(.green)
                        
                        Button("Save") {
                            
                        }
                        .tint(.blue)
                       
                        Button("Junk") {
                            
                        }
                        .tint(.black)
                    }
            }
           // .onDelete(perform: delete)
        }
    }
    
    func delete(indexSet : IndexSet){
        
    }
}

#Preview {
    SwipeActionDemo()
}
