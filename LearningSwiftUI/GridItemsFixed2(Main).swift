//
//  LazyVGrid.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct GridItemsFixed2: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    var body: some View {
        ScrollView{
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            
            LazyVGrid(columns: columns, alignment:.center, spacing: 6, pinnedViews: [.sectionHeaders]) {
                
                Section(header:
                            ScrollView(.horizontal){
                    LazyHGrid(rows: rows,spacing: 20) {
                        ForEach(0..<50) { item in
                            Rectangle()
                                .fill(.red)
                                .cornerRadius(10)
                                .frame(width: 150,height: 150)
                            
                        }
                    }
                    .padding(8)
                } .background(.white)
                
                ){
                    ForEach(0..<50) { item in
                        Rectangle()
                            .frame(height: 150)
                        
                    }
                }
                
                Section(header:
                            Text("Section 2")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(.red)
                    .padding())
                {
                    ForEach(0..<50) { item in
                        Rectangle()
                            .fill(.green)
                            .frame(height: 150)
                        
                    }
                }
            }
            
        }
    }
}

#Preview {
    GridItemsFixed2()
}
