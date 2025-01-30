//
//  ScrollView.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct ScrollViewDemo: View {
    var body: some View {
       
            VStack{
                Text("VStack")
                ScrollView(.vertical, showsIndicators: true){
                    VStack{
                        ForEach(0..<50) { index in
                            Rectangle()
                                .fill(.blue)
                                .frame(height: 300)
                        }
                    }
                }
                
                Text("HStack")
                ScrollView(.horizontal, showsIndicators: true){
                    HStack{
                        
                        ForEach(0..<50) { index in
                            Rectangle()
                                .fill(.red)
                                .frame(width: 300)
                            
                        }
                    }
                }
                
                Text("LazyVStack")
                ScrollView(.vertical, showsIndicators: true){
                    LazyVStack{
                        ForEach(0..<50) { index in
                            Rectangle()
                                .fill(.red)
                                .frame(height: 300)
                        }
                    }
                }
                
                Text("LazyHStack")
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack{
                        ForEach(0..<50) { index in
                            Rectangle()
                                .fill(.green)
                                .frame(width: 300)
                        }
                    }
                }
                
                
            }
        }
}

#Preview {
    ScrollViewDemo()
}
