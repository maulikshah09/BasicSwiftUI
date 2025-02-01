//
//  TapGesture.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

struct TapGesture: View {
    @State var isSelected = false
    
    var body: some View {
        VStack(spacing: 20){
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundStyle(isSelected ? .green : .red)
 
            Button {
                isSelected.toggle()
            } label: {
                Text("Button")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(25)
            }
            
            Text("Tap gesture")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(25)
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 2) {
                    isSelected.toggle()
                }
            
            Spacer()
        }
        .padding(40)
    }
}

#Preview {
    TapGesture()
}
