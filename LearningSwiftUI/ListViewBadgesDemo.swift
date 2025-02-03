//
//  ListViewBadgesDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/4/25.
//

import SwiftUI

struct ListViewBadgesDemo: View {
    var body: some View {
        List{
            Text("Hello, World!")
                .badge("New Items")
            Text("Hello, World!")
                .badge(10)
            Text("Hello, World!")
            Text("Hello, World!")
        }
    }
}

#Preview {
    ListViewBadgesDemo()
}
