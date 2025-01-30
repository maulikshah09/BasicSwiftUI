//
//  TurneryOperator.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct TurneryOperator: View {
    @State var isStartingState = false
    
    var body: some View {
        VStack{
           
            Button("Button : \(isStartingState.description)"){
                isStartingState.toggle()
            }
            
            Text(isStartingState ? "Starting State!!!" : "Ending State..." )
            
            RoundedRectangle(cornerRadius: isStartingState ? 25 : 0)
                .fill(isStartingState ? .red : .blue)
                .frame(
                    width: isStartingState ? 200 : 50,
                    height: isStartingState ? 400 : 50)
            
            Spacer()
        }
       
    }
}

#Preview {
    TurneryOperator()
}
