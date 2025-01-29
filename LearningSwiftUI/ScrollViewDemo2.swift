//
//  ScrollViewDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct ScrollViewDemo2: View {
    var body: some View {
        ScrollView{
            VStack{
                ForEach(0..<10) { index in
                    ScrollView(.horizontal,showsIndicators: true) {
                        HStack{
                            ForEach(0..<20) { index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                           
                        }
                    }
                   
                }
            }
        }
    }
}

#Preview {
    ScrollViewDemo2()
}
