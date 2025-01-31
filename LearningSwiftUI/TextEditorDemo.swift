//
//  TextEditorDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/31/25.
//

import SwiftUI

struct TextEditorDemo: View {
    @State var textEditorText = "This is starting text"
    @State var savedText : String = ""
    var body: some View {
        NavigationStack {
            
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                   // .foregroundStyle(.white)
                    .colorMultiply(.gray) // only works on black text
                    .cornerRadius(10)
                Button {
                    savedText = textEditorText
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Text(savedText)
                Spacer()
            }.padding()
          
             
           .navigationBarTitle("Text Editor Demo")
        }
    }
}

#Preview {
    TextEditorDemo()
}
