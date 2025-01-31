//
//  TextField.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/31/25.
//

import SwiftUI

struct TextFieldDemo: View {
    @State var textFieldText : String = ""
    @State var dataArray : [String] = []
    
    var body: some View {
        
        NavigationStack{
            VStack {
                TextField("Type Something here...",text: $textFieldText)
                //.textFieldStyle(.roundedBorder)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundStyle(.red)
                    .font(.headline)
                
                
                
                Button {
                    if textisAppropriate(){
                        saveText()
                    }
                } label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textisAppropriate() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                        .font(.headline)
                }.disabled(!textisAppropriate())
                
                ForEach(dataArray,id: \.self) {data in
                    Text(data)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Textfiled")
        }
        
    }
    
    func textisAppropriate() -> Bool {
        //check text
        if textFieldText.count >= 3{
            return true
        }
        return false
    }
    
    func saveText(){
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}

#Preview {
    TextFieldDemo()
}
