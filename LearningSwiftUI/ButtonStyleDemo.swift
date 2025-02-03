//
//  ButtonStyleDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/4/25.
//

import SwiftUI

struct ButtonStyleDemo: View {
    var body: some View {
        VStack{
            
            
            Button("Button Title"){
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            
            Button("Button Title"){
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
            .buttonStyle(.bordered)
            
            Button("Button Title"){
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
           
            Button("Button Title"){
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
            
            Button{
                
            }label: {
                Text("Button Title")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
    }
}

#Preview {
    ButtonStyleDemo()
}
