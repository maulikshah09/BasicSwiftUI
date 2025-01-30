//
//  Buttons.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct Buttons: View {
    @State var title : String = "This is my title"
    
    var body: some View {
        VStack (spacing : 30){
            Text("\(title)")
            Button("Press me."){
                self.title = "Button is press"
            }
            .accentColor(.red)
            
            Button(action: {
                self.title = "Button #2 was pressed"
            } , label: {
                Text("Save")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal,20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            })
            
            Button(action: {
                self.title = "Button #3 was pressed"
            } , label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 100,height: 100)
                    .shadow(radius: 10)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.purple)
                    }
                
            })
            
            Button(action: {
                self.title = "Button is Finish"
            },label :{
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal,10)
                    .background(
                        Capsule()
                            .stroke(.gray,lineWidth: 3.0)
                    )
            })
        }
    }
}

#Preview {
    Buttons()
}
