//
//  ContentmenuDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/31/25.
//

import SwiftUI

struct ContentmenuDemo: View {
    @State var backgroundColor = Color.green
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0){
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftful Thinking")
                .font(.headline)
            Text("How to use content menu")
                .font(.subheadline)
    
        }
        .foregroundStyle(.white)
        .padding(30)
        .background(backgroundColor.cornerRadius(30))
        .contextMenu(menuItems: {
            Button {
                backgroundColor = .yellow
            } label: {
                Label("Share post",systemImage: "flame.fill")
            }
            
            Button {
                backgroundColor = .red
            } label: {
                Text("Report post")
            }
           
            Button {
                backgroundColor = .green
            } label: {
                HStack {
                    Text("Like post")
                    Image(systemName: "heart.fill")
                }
            }
        })
    }
}

#Preview {
    ContentmenuDemo()
}
