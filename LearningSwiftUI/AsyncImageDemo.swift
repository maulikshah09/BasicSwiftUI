//
//  AsyncImageDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/3/25.
//

import SwiftUI

struct AsyncImageDemo: View {
    let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        VStack(spacing: 20){
            AsyncImage(url: url,content: { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 100)
                    .cornerRadius(20)
            },placeholder: {
                ProgressView()
            })
            
            
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,height: 100)
                        .cornerRadius(20)
                case .failure(_):
                    Image(systemName: "questionmark")
                        .font(.headline)
                 default:
                    Image(systemName: "questionmark")
                        .font(.headline)
                }
            }
        }
        
        
    }
}

#Preview {
    AsyncImageDemo()
}
