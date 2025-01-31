//
//  AlertView.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/31/25.
//

import SwiftUI

struct AlertViewDemo: View {
    @State var showAlert  = false
    @State var backgroundColor = Color.yellow
    
    @State var alertTitle  = ""
    @State var alertMessage  = ""
    
    @State var alertType : MyAlerts? = nil
    
    enum MyAlerts {
        case success
        case error
    }

    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            VStack {
                Button("Button 1") {
                    alertType = .error
//                    alertTitle = "ERROR UPLOADING VIDEO"
//                    alertMessage = "The video could not uploaded"
                    showAlert.toggle()
                }
                
                Button("Button 2") {
                    alertType = .success
//                    alertTitle = "Successfully uploaded video 🥰"
//                    alertMessage = "your video is now public"
                    showAlert.toggle()
                }
            }
            .alert(isPresented: $showAlert){
                getAlert()
            }
        }
    }
    
     func getAlert() -> Alert {
         switch alertType{
         case .error:
             return Alert(
                        title: Text("There was an error"))
         default:
             return Alert(
                title: Text("There was an success"),message: nil,dismissButton:.default(Text("OK"),action: {
                    backgroundColor = .green
                }))
         }
         
//        return Alert(
//            title: Text(alertTitle),
//            message: Text(alertMessage),
//            primaryButton: .destructive(Text("DELETE"), action: {
//                backgroundColor = .red
//            }),
//            secondaryButton: .cancel())
         
         //Alert(title: Text("There is an error"))
    }
}

#Preview {
    AlertViewDemo()
}
