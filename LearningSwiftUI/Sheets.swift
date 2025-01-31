//
//  Sheets.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/30/25.
//

import SwiftUI

struct Sheets: View {
    
    @State var showSheet = false
    
    var body: some View {
        ZStack{
            Color.green
                .ignoresSafeArea()
            
            Button {
                showSheet = true
            } label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            }
//            .fullScreenCover(isPresented: $showSheet) {
//                SecondScreen()
//            }
          
            .sheet(isPresented: $showSheet) {
                SecondScreen(showSheet: $showSheet)
             }

        }
    }
}


struct SecondScreen : View {
    @Binding var showSheet: Bool
   // @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.red
                .ignoresSafeArea()
            
            Button {
                showSheet = false
              //  presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)

            }
        }
    }
}

#Preview {
    Sheets()
}
