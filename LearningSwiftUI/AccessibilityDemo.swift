//
//  AccessibilityDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/16/25.
//

import SwiftUI

struct AccessibilityDemo: View {
    
    @Environment(\.sizeCategory) var sizeCategory
        
    var body: some View {
        NavigationStack{
            List {
                ForEach (0..<10) { _ in
                    VStack(alignment: .leading,spacing: 8) {
                        HStack{
                            Image(systemName: "heart.fill")
                            Text("Welcome to my app")
                        }
                        
                        Text("This is some longer text that expands to multiple lines.")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity,alignment: .leading)
                          //  .truncationMode(.head)
                            .lineLimit(3)
                           // .minimumScaleFactor(0.8)
                            .minimumScaleFactor(sizeCategory.customMinScaleFactore)
                     }
                   // .frame(height : 100)
                    .background(.red)
                   
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hello World")
        }
    }
}

extension ContentSizeCategory {
    var customMinScaleFactore : CGFloat {
        switch self {
        case .extraSmall,.small,.medium :
            return 1.0
  
        case .large,.extraLarge,.extraExtraLarge:
            return 0.8
        default :
            return 0.6
        }
        
    }
}

#Preview {
    AccessibilityDemo()
}
