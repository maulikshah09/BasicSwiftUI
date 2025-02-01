//
//  Picker.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

struct PickerDemo: View {
    
    @State var selection : Int = 1 //match with tag. you can also string in tag and match
    
    var body: some View {
        VStack {
            HStack{
                Text("Age:")
                Text("\(selection)")
            }
            
            Picker(selection: $selection) {
                ForEach(18..<20) { value in
                    Text("\(value)")
                        .tag(value)
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            } label: {
                Text("Picker")
            }
            //.background(.gray.opacity(0.30))
            .pickerStyle(.segmented)
        }

    }
}

#Preview {
    PickerDemo()
}
