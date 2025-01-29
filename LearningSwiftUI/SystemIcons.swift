//
//  SystemIcons.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

struct SystemIcons: View {
    var body: some View {
        ScrollView{
            Image(systemName: "xmark")
                
               // .font(.system(size: 200))
                .resizable()
              //  .aspectRatio(contentMode: .fit)
              //  .scaledToFit() // same like above aspect fit
                .scaledToFill()
                .foregroundColor(.green)
                .frame(width: 200,height: 200)
              //  .clipped()
            
            Image(systemName: "person.fill.badge.plus")
                .renderingMode(.original)
               // .font(.system(size: 200))
                .resizable()
              //  .aspectRatio(contentMode: .fit)
              //  .scaledToFit() // same like above aspect fit
                .scaledToFill()
                .foregroundColor(.yellow)
                .frame(width: 200,height: 200)
              //  .clipped()
            
            
            Image(systemName: "xmark")
                
               // .font(.system(size: 200))
                .resizable()
              //  .aspectRatio(contentMode: .fit)
              //  .scaledToFit() // same like above aspect fit
                .scaledToFill()
                .foregroundColor(.green)
                .frame(width: 200,height: 200)
              //  .clipped()
            
            
            Image(systemName: "bolt.fill")
              .imageScale(.medium)
            
            Image(systemName: "cloud.rain.fill")
                .symbolRenderingMode(.multicolor) // Enables multicolor mode
                .renderingMode(.original)
                .foregroundColor(.yellow) // this will not work
            
            Image(systemName: "cloud.rain.fill")
                .symbolRenderingMode(.hierarchical) // Uses a single color hierarchy
                .foregroundColor(.yellow) // Now this works
        }
     
    }
}

#Preview {
    SystemIcons()
}
