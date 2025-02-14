//
//  AlignmentGuideDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/14/25.
//

import SwiftUI

struct AlignmentGuideDemo: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, World!")
                .background(.blue)
//                .padding(.leading,10) // first way to add space
//                .offset(x: -20 )
                .alignmentGuide(.leading) { dimension in
                    return dimension.width * 0.5 //20
                }
            
            Text("This is some other text!")
                .background(.red)
        }
        .background(.orange)
    }
}

struct AlignmentChildView : View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            row(title: "Row 1", showIcon: false)
            row(title: "Row 2", showIcon: true)
            row(title: "Row 3", showIcon: false)
        }
        .padding(16)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(40)
    }
    
    private func row(title : String,showIcon : Bool) -> some View{
        HStack(spacing: 10){
            if showIcon {
                Image(systemName: "info.circle")
                    .frame (width: 30,height: 30)
            }
            Text(title)
            Spacer()
        }
        .alignmentGuide(.leading) { dimentions in
            return showIcon ? 40 : 0
        }
    }
}

#Preview {
    AlignmentChildView()
}
