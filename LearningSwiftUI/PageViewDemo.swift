//
//  PageView.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

//struct PageViewDemo: View {
//    
//    let icons: [String] = [
//        "house" ,
//        "music.note" ,
//        "cart",
//        "house.fill",
//        "heart.fill"
//    ]
//    
//    var body: some View {
//        TabView{
//            ForEach(icons,id: \.self){ icon in
//                Image(systemName: icon)
//                    .resizable()
//                    .scaledToFit()
//                    .padding(30)
//                    .frame(height: 300)
//            }
//        }
//        .background(
//            RadialGradient(colors: [.red,.blue], center: .center, startRadius: 5, endRadius: 300)
//        )
//        .frame(height: 500)
//        .tabViewStyle(.page)
//    }
//}


struct PageViewDemo: View {
    let icons: [String] = [
        "house",
        "music.note",
        "cart",
        "house.fill",
        "heart.fill"
    ]
    
    @State private var selectedPageIndex: Int = 0 // Track the selected page index
    
    var body: some View {
        VStack {
            TabView(selection: $selectedPageIndex) { // Bind to selectedPageIndex
                ForEach(Array(icons.enumerated()), id: \.element) { index, icon in
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                        .frame(height: 300)
                        .tag(index) // Tag each page with its index
                }
            }
            .background(
                RadialGradient(colors: [.red, .blue], center: .center, startRadius: 5, endRadius: 300)
            )
            .frame(height: 500)
            .tabViewStyle(.page)
            
            // Display the selected page index
            Text("Selected Page: \(selectedPageIndex + 1)")
                .font(.headline)
                .padding()
        }
    }
}

#Preview {
    PageViewDemo()
}
