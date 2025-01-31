//
//  ToolBarDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/31/25.
//

import SwiftUI

struct ToolBarDemo: View {
    @State var text : String = ""
    
    var body: some View {
      
        NavigationStack{
            ZStack{
                Color.white.ignoresSafeArea()
               
                ScrollView{
                    TextField("PlaceHolder" , text: $text)
                    
                    ForEach(0..<50){ _ in
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 200, height: 200)
                    }
                    Text("Hey 😍")
                        .foregroundColor(.white)
                }
                
            }
      
            // every where you can add toolbar keyboard,naviagtionbar and much more.
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "heart.fill")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
            }
            
           // hide naviagion bar using toolbar
            //.toolbar(.hidden, for :.navigationBar)
            .navigationTitle("ToolBar")
            //.toolbarBackground(.hidden, for: .navigationBar)
           // .toolbarColorScheme(.dark, for: .navigationBar)
            
            .toolbarTitleMenu {
                Button("Screen 1") {
                    
                }
                
                Button("Screen 2") {
                    
                }
            }
        }
    }
}

#Preview {
    ToolBarDemo()
}
