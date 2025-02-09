//
//  MultipleSheetsDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/9/25.
//

import SwiftUI

struct RandomModel : Identifiable{
    let id = UUID().uuidString
    let title : String
}
// 1 - use a biniding // if handy view then not working

// 2 - use multiple .sheet // its working multiple sheet but id need to make multiple state variable

// 3 -  use $item

struct MultipleSheetsDemo: View {
//    @State var isShowSheet = false
//    @State var isShowSheet2 = false
    
    @State var selectedModel : RandomModel? = nil
    
//    var body: some View {
//        VStack(spacing: 20){
//            Button("Button 1"){
//                isShowSheet.toggle()
//            }
//            .sheet(isPresented:$isShowSheet) {
//                NextScreen(selectedModel: RandomModel(title: "ONE"))
//            }
//            
//            
//            Button("Button 2"){
//                isShowSheet2.toggle()
//            }
//            .sheet(isPresented:$isShowSheet2) {
//                NextScreen(selectedModel: RandomModel(title: "TWO"))
//            }
//        }
//    }
    
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                
                ForEach(0..<50) { index in
                    Button("Button \(index)"){
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
        }
    }
}

struct NextScreen: View {
    let selectedModel : RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsDemo()
}
