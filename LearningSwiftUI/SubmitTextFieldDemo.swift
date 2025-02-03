//
//  SubmitTextFieldDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/4/25.
//

import SwiftUI

struct SubmitTextFieldDemo: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack{
            TextField("PlaceHolder...",text:$text)
                .submitLabel(.route)
                .onSubmit {
                    print("somthing on the console!")
                    // perform action when you press in keyboard return
                }
            
            TextField("PlaceHolder...",text:$text)
                .submitLabel(.next)
                .onSubmit {
                    print("somthing on the console!")
                    // perform action when you press in keyboard return
                }
            
            TextField("PlaceHolder...",text:$text)
                .submitLabel(.search)
                .onSubmit {
                    print("somthing on the console!")
                    // perform action when you press in keyboard return
                }
        }
       
        
    }
}

#Preview {
    SubmitTextFieldDemo()
}
