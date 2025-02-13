//
//  Timer4.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/13/25.
//

import SwiftUI

struct Timer4: View {
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State var count = 1
    
    var body: some View {
         ZStack{
            RadialGradient(colors: [.purple,.blue],
                           center: .center,
                           startRadius: 4,
                           endRadius: 500)
            .ignoresSafeArea()
            
//             HStack(spacing: 15){
//                 Circle()
//                     .offset(y : count == 1 ? 20 : 0)
//                 Circle()
//                     .offset(y : count == 2 ? 20 : 0)
//                 Circle()
//                     .offset(y : count == 3 ? 20 : 0)
//             }
//             .frame(width: 150)
//             .foregroundStyle(.white)
             
             TabView(selection: $count) {
                 Rectangle()
                     .foregroundStyle(.red)
                     .tag(1)
                 Rectangle()
                     .foregroundStyle(.blue)
                     .tag(2)
                 Rectangle()
                     .foregroundStyle(.green)
                     .tag(3)
                 Rectangle()
                     .foregroundStyle(.yellow)
                     .tag(4)
                 Rectangle()
                     .foregroundStyle(.black)
                     .tag(5)
             }
             .frame(height: 200)
             .tabViewStyle(.page)
        }
        .onReceive(timer) { value in
            withAnimation(.default){
                count = count == 5 ? 1 : count + 1
            }
        }
    }
}

#Preview {
    Timer4()
}

