//
//  Timer3.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/13/25.
//

import SwiftUI

struct Timer3: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State var timeRemaining = ""
    let futureDate : Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date())  ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute,.second], from: Date(),to: futureDate)
      //  let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second =  remaining.second ?? 0
        timeRemaining = " \(minute) minutes :\(second) seconds"
    }
    
    var body: some View {
         ZStack{
            RadialGradient(colors: [.purple,.blue],
                           center: .center,
                           startRadius: 4,
                           endRadius: 500)
            .ignoresSafeArea()
            
            Text(timeRemaining)
                .font(.system(size: 100,weight: .semibold,design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer) { value in
            updateTimeRemaining()
        }
    }
    
    
}

#Preview {
    Timer3()
}
