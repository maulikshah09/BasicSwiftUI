//
//  Toggle.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/31/25.
//

import SwiftUI

struct ToggleDemo: View {
    @State var toggleIsOn = false
    
    var body: some View {
        VStack {
            HStack{
                Text("Status:")
                Text(toggleIsOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(isOn: $toggleIsOn) {
                Text("Change Status")
            }.toggleStyle(SwitchToggleStyle(tint: .purple))
            Spacer()
        }.padding(.horizontal,100)
    }
}

#Preview {
    ToggleDemo()
}
