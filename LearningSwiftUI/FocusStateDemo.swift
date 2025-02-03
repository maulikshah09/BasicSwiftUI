//
//  FocusStateDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/4/25.
//

import SwiftUI

struct FocusStateDemo: View {
    
    enum OnboardingFields {
        case username
        case password
    }
 
//    @FocusState private var usernameInFocus : Bool
//    @FocusState private var passwordInFocus : Bool
    @FocusState private var fieldInFocuse : OnboardingFields?
    
    @State private var username: String = ""
    @State private var password: String = ""

    
    var body: some View {
        VStack(spacing: 30){
            TextField("Add your name here...", text: $username)
                //.focused($usernameInFocus)
                .focused($fieldInFocuse,equals: .username)
                .padding(.horizontal)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            SecureField("Add your password here...", text: $password)
               // .focused($passwordInFocus)
                .focused($fieldInFocuse,equals: .password)
                .padding(.horizontal)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            Button("SIGN UP 🚀"){
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
             
                if usernameIsValid && passwordIsValid{
                    print("SIGN UP")
                }else if usernameIsValid{
                    fieldInFocuse = .password
//                    usernameInFocus = false
//                    passwordInFocus = true
                }else {
                    fieldInFocuse = .username
//                    passwordInFocus = false
//                    usernameInFocus = true
                }
                
            }
            
//            Button("TOGGLE FOCUS STATE"){
//                usernameInFocus.toggle()
//            }
        }
        .padding(40)
        .onAppear(){
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//                self.usernameInFocus = true
//            }
        }
     
       
    }
}

#Preview {
    FocusStateDemo()
}
