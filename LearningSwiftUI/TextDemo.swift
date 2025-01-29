//
//  TextView.swift
//  SwiftUIDemo
//
//  Created by Maulik Shah on 1/29/25.
//

import SwiftUI

struct TextDemo: View {
    var body: some View {
        Text("Hello, World! maulik is here. awesome view view is goof nice  heavy break fast".capitalized)
//            .font(.body)
//            .fontWeight(.semibold)
//            .bold()
//            .underline()
//            .underline(true, color: .red)
//            .italic()
//            .strikethrough(true, color: .red)
//            .font(.system(size: 20, weight: .bold, design: .serif))
//            .baselineOffset(0)
//            .kerning(10)
//            .multilineTextAlignment(.center)
//            .foregroundColor(.red)
            .frame(width: 200)
            .minimumScaleFactor(1.0)
    }
}

#Preview {
    TextDemo()
}
