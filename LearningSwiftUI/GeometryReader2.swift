//
//  GeometryReader2.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/9/25.
//

import SwiftUI

struct GeometryReader2: View {
    
    func getPerentage(geo: GeometryProxy) -> Double{
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators:false ){
            HStack{
                ForEach(0..<20){index in
                    GeometryReader{ gemetry in
                        RoundedRectangle(cornerRadius: 40)
                            .rotation3DEffect(Angle(degrees: getPerentage(geo: gemetry) * 10), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300,height:250)
                    .padding()
                }
            }
        }
      
    }
}

#Preview {
    GeometryReader2()
}
