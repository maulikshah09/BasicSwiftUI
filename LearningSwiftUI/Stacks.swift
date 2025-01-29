//
//  Stack.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

struct Stack: View {
    var body: some View {
        ScrollView{
            VStack (alignment: .leading,spacing: 0){
                Rectangle()
                    .fill(.red)
                    .frame(width: 200,height: 200)
                Rectangle()
                    .fill(.green)
                    .frame(width: 100,height: 100)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 50,height: 50)
                
            }.background(.yellow)
            
            HStack(alignment: .center,spacing: 8){
                Rectangle()
                    .fill(.red)
                    .frame(width: 200,height: 200)
                Rectangle()
                    .fill(.green)
                    .frame(width: 100,height: 100)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 50,height: 50)
            }
            
            ZStack{
                Rectangle()
                    .fill(.red)
                    .frame(width: 150,height: 150)
                Rectangle()
                    .fill(.green)
                    .frame(width: 130,height: 130)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100,height: 100)
                
            }
            
            ZStack(alignment: .top){
                Rectangle()
                    .fill(.red)
                    .frame(width: 150,height: 150)
                Rectangle()
                    .fill(.green)
                    .frame(width: 130,height: 130)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100,height: 100)
                
            }
            
            ZStack(alignment: .topLeading){
                Rectangle()
                    .fill(.red)
                    .frame(width: 150,height: 150)
                Rectangle()
                    .fill(.green)
                    .frame(width: 130,height: 130)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100,height: 100)
                
            }
            
            ZStack(alignment: .bottomTrailing){
                Rectangle()
                    .fill(.red)
                    .frame(width: 150,height: 150)
                Rectangle()
                    .fill(.green)
                    .frame(width: 130,height: 130)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100,height: 100)
                
            }
        }
       
    }
}

#Preview {
    Stack()
}
