//
//  DarkMode.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

struct DarkModeDemo: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack(spacing: 20) {
                    Text("This color is Primary")
                        .foregroundStyle(.primary)
                    
                    Text("This color is Secondary")
                        .foregroundStyle(.secondary)
                    
                    Text("This color is Black")
                        .foregroundStyle(.black)
                    
                    Text("This color is white")
                        .foregroundStyle(.white)
                    
                    Text("This color is red")
                        .foregroundStyle(.red)
                    
                    Text("This color is globally adaptive")
                        .foregroundStyle(Color(.adaptive))
                    
                    Text("this color is locally adaptive!")
                        .foregroundStyle(colorScheme == .dark ? .green: .blue)
                    
                }
            }
            .navigationTitle("Dark Mode")
        }
       
    }
}


// this will not work for multiple preview
//#Preview {
//    DarkModeDemo()
//}

// so we have to use
struct DarkModeDemo_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            DarkModeDemo()
                .preferredColorScheme(.light)
            
            DarkModeDemo()
                .preferredColorScheme(.dark)
        }
       
    }
}
