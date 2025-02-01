//
//  Onappear.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

struct Onappear: View {
    @State var myText: String = "Start text."
    
    @State var count = 0
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Text(myText)
                
                LazyVStack {
                    ForEach(0..<50){ _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 200)
                            .padding()
                            .onAppear{
                                count += 1
                            }
                    }
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                    myText = "this is new text"
                }
            }.onDisappear{
                myText = "Ending text."
            }
        
            .navigationTitle("On Appear : \(count)")
        }
    }
}

#Preview {
    Onappear()
}
