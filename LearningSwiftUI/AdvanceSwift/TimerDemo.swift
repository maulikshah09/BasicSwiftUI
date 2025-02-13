//
//  TimerDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/13/25.
//

import SwiftUI

struct TimerDemo: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State var currentDate : Date = Date()
    
    var dateFormatter : DateFormatter{
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        
        
        ZStack{
            RadialGradient(colors: [.purple,.blue],
                           center: .center,
                           startRadius: 4,
                           endRadius: 500)
            .ignoresSafeArea()
            
            Text(dateFormatter.string(from: currentDate))
                .font(.system(size: 100,weight: .semibold,design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer) { value in
            currentDate = value
        }
    }
    
    
}

#Preview {
    TimerDemo()
}
