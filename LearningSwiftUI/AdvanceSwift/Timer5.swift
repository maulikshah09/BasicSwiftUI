//
//  Timer5.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/13/25.
//

import SwiftUI

struct Timer5: View {
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State var count = 0
    
    var body: some View {
         ZStack{
            RadialGradient(colors: [.purple,.blue],
                           center: .center,
                           startRadius: 4,
                           endRadius: 500)
            .ignoresSafeArea()
            
             HStack(spacing: 15){
                 Circle()
                     .offset(y : count == 1 ? 20 : 0)
                 Circle()
                     .offset(y : count == 2 ? 20 : 0)
                 Circle()
                     .offset(y : count == 3 ? 20 : 0)
             }
             .frame(width: 150)
             .foregroundStyle(.white)
        }
        .onReceive(timer) { value in
            withAnimation(.default){
                count = count == 5 ? 0 : count + 1
            }
        }
    }
}

#Preview {
    Timer5()
}
