//
//  TabView.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

struct TabViewDemo: View {
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
           
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(0)
            
            
            BrowseView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            
            ProfileView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .tint(.red)
    }
}

#Preview {
    TabViewDemo()
}

struct HomeView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea(edges: [.top])
           
            VStack{
                Text("Home Tab View")
                    .foregroundStyle(.white)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to Profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                }

            }
        }
    }
}

struct BrowseView: View {
    var body: some View {
        Text("BROWSER TAB")
    }
}

struct ProfileView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea(edges: [.top])
           
            VStack{
                Text("Profile Tab View")
                    .foregroundStyle(.white)
                
                Button {
                    selectedTab = 0
                } label: {
                    Text("Go to Home")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                }

            }
        }
    }
}
