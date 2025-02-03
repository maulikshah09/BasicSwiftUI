//
//  TabViewBandgesDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/4/25.
//

import SwiftUI

// List
// TabView we can use

struct TabViewBadgesDemo: View {
    var body: some View {
        TabView{
            Color.red
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("hello")
                }.badge(2)
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("hello")
                }.badge("New")
            
            Color.yellow
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("hello")
                }
        }
    }
}

#Preview {
    TabViewBadgesDemo()
}
