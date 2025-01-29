//
//  Spacer.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

struct SpacerInfo: View {
    var body: some View {
        HStack(spacing: 0){
          
            Spacer(minLength: 0) // according to iphone size manage space
                .frame(height : 10)
                .background(.orange)
         
            Rectangle()
                .frame(width: 50,height: 50)
            
            Spacer() // according to iphone size manage space
                .frame(height : 10)
                .background(.orange)
            
            Rectangle()
                .fill(.red)
                .frame(width: 50,height: 50)
            Spacer()
                .frame(height : 10)
                .background(.orange)
            
            Rectangle()
                .fill(.green)
                .frame(width: 50,height: 50)
            Spacer(minLength: 0)
                .frame(height : 10)
                .background(.orange)
            
        }
        .background(.yellow)
        .padding(.horizontal,20)
        .background(.blue)
        
        
    }
    
    
}

#Preview {
    SpacerInfo()
}
