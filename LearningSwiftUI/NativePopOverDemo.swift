//
//  PopOverDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/5/25.
//

import SwiftUI

struct PopOverDemo: View {
    @State private var showPopover = false
    
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            
            Button("click me"){
                showPopover.toggle()
            }
            .padding(20)
            .background(.yellow)
//            .popover(isPresented: $showPopover, attachmentAnchor:.point(.topLeading), content: {
//                Text("Hello, Subscriber's!")
//                    .padding()
//                    .presentationCompactAdaptation(.popover)
//            })
            
            .popover(isPresented: $showPopover, attachmentAnchor:.point(.topLeading), content: {
                Text("Hello, Subscriber's!")
                    .padding()
                    .presentationCompactAdaptation(.popover)
            })
            
//            .popover(isPresented: $showPopover){
//                Text("Hello, Subscriber's!")
//                    .padding()
//                    .presentationCompactAdaptation(.popover)
//                   // .presentationCompactAdaptation(.sheet)
//            }
            
        }
        
    }
}

#Preview {
    PopOverDemo()
}
