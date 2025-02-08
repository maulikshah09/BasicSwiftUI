//
//  SwiftUIViewReader.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/8/25.
//

import SwiftUI

struct ScrollViewReaderDemo: View {
  
    @State var scrollToIndx : Int = 0
    @State var textFieldText : String = ""
    
    var body: some View {
        VStack(spacing: 12.0) {
            TextField("Enter a # here..",text: $textFieldText)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
                .border(.gray)
               
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("SCROLL NOW"){
                withAnimation(.spring) {
                    if let index = Int(textFieldText){
                        scrollToIndx = index
                    }
                }
            }
            
            ScrollView{
                ScrollViewReader { proxy in
                    ForEach(0..<50){index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height : 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndx) { newValue in
                        withAnimation(.spring){
                            proxy.scrollTo(newValue,anchor: nil)
                        }
                    }
                    
                }
                
            }
        }
    }
}

#Preview {
    ScrollViewReaderDemo()
}
