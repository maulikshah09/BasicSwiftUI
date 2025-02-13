//
//  TimerDemo2.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/13/25.
//
 

import SwiftUI

struct TimerDemo2: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()

    @State var count : Int = 10
    @State var finishedText: String? = nil
    
    
    var body: some View {
        
        
        ZStack{
            RadialGradient(colors: [.purple,.blue],
                           center: .center,
                           startRadius: 4,
                           endRadius: 500)
            .ignoresSafeArea()
            
            Text(finishedText ?? "\(count)")
                .font(.system(size: 100,weight: .semibold,design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer) { _ in
            if count <= 1 {
                finishedText = "wow"
            }else{
                count -= 1 
            }
        }
    }
    
    
}

#Preview {
    TimerDemo2()
}
