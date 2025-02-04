//
//  ResizableSheetsDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/4/25.
//

import SwiftUI

struct ResizableSheetsDemo: View {
    @State private var showSheet  = false
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        Button("Click Me!"){
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            MyNextView(detents: $detents)
               // .presentationDetents([.fraction(0.1),.height(500),.medium,.large])
               // .presentationDetents([.height(500)])
              //  .presentationDetents([.fraction(0.9),.medium,.large])
            //    .presentationDetents([.medium,.large])
//                .presentationDragIndicator(.hidden)
//                .interactiveDismissDisabled()
                .presentationDetents([.medium,.large], selection: $detents)
                .presentationDragIndicator(.hidden)
        }
    }
}

struct MyNextView : View {
    @Binding var detents : PresentationDetent
    
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Button("Medium") {
                    detents = .medium
                }
                
                Button("Large") {
                    detents = .large
                }
            }
        }
    }
}

#Preview {
    ResizableSheetsDemo()
}
