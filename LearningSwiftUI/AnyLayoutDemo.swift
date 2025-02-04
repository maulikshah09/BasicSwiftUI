//
//  AnyLayoutDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/5/25.
//

import SwiftUI

struct AnyLayoutDemo: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    
    var body: some View {
        VStack (spacing: 12){
            Text("Horizontal: \(horizontalSizeClass.debugDescription)")
            Text("vertical: \(verticalSizeClass.debugDescription)")
            
            let layout : AnyLayout = horizontalSizeClass == .compact ? AnyLayout(VStackLayout()):AnyLayout(HStackLayout())
            
            layout{
                Text("Alpha")
                Text("Beta")
                Text("Gama")
            }
            
//            if horizontalSizeClass == .compact{
//                VStack{
//                    Text("Alpha")
//                    Text("Beta")
//                    Text("Gama")
//                }
//            }else{
//                HStack{
//                    Text("Alpha")
//                    Text("Beta")
//                    Text("Gama")
//                }
//            }
           
        }
    }
}

#Preview {
    AnyLayoutDemo()
}
