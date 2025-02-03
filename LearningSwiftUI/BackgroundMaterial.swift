//
//  BackgroundMaterial.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/3/25.
//

import SwiftUI

struct BackgroundMaterial: View {
    var body: some View {
        VStack{
            Spacer()
            VStack{
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 30,height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial) // something new here
            .cornerRadius(20)
        }
        .ignoresSafeArea()
        .background(
            Image(.therock)
        )
    }
}

#Preview {
    BackgroundMaterial()
}
