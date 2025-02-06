//
//  ContentUnavailableView.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/5/25.
//

import SwiftUI

// iOS 17

struct ContentUnavailableViewDemo: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            ContentUnavailableView.search(text: "apple")
            
//            ContentUnavailableView("No Internet Connection", systemImage: "wifi.slash" , description: Text("Please connect to internet and try again."))
//            
            Button("Maulik") {
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    ContentUnavailableViewDemo()
}
