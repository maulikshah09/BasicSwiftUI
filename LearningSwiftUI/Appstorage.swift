//
//  Appstorage.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/2/25.
//

import SwiftUI

struct Appstorage: View {
    @AppStorage("name") var currentUserName : String?
    @State var text : String = ""
    var body: some View {
        VStack(spacing: 20) {
            
            if let name = currentUserName{
                Text(name)
            }
            
            TextField( "Enter Name", text: $text)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .foregroundStyle(.black)
                .font(.headline)
            
            
            
            Button("Save".uppercased()) {
                currentUserName = text
                text = ""
            }
        }
        .padding()
    }
}

#Preview {
    Appstorage()
}
