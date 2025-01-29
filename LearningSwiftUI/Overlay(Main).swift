//
//  Overlay.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

struct Overlay: View {
    var body: some View {
        Circle()
            .fill(.pink)
            .frame(width: 100,height: 100)
            .overlay(
                Text("1")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            ).background(
                Circle()
                    .fill(Color.purple)
                    .frame(width: 110,height: 110,alignment: .center)
            )
            
            .padding(.all,50)
      
        Rectangle()
            .frame(width:100, height: 100)
            .overlay(
                Rectangle()
                    .fill(.blue)
                    .frame(width:50, height: 50, alignment: .center)
                , alignment: .topLeading
            )
            .background(
                Rectangle()
                    .fill(.red)
                    .frame(width:150, height: 150)
                , alignment: .bottomTrailing)
        
            .padding(.all,50)
        
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.red,.blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: .blue.opacity(0.30), radius: 10,x: 0.0,y:10.0)
                
                    .overlay(alignment: .topTrailing, content: {
                        Circle()
                            .fill(.blue)
                            .frame(width: 35,height: 35)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(color: .green.opacity(0.30), radius: 10,x: 5.0,y:5.0)
                    })
            )
        
    }
}

#Preview {
    Overlay()
}
