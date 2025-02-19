//
//  LogPressGestureDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/8/25.
//

import SwiftUI

struct LogPressGestureDemo: View {
    @State var isComplete: Bool = false
    @State var isSuccess = false
    
    var body: some View {
        
        //example 2
        VStack{
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(.gray)
            
            HStack (spacing: 10){
                Text("Click Here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0,maximumDistance: 50) { isPressing in
                        
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        }else{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess{
                                    withAnimation {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                        
                    } perform: {
                        withAnimation(.easeInOut) {
                            isSuccess.toggle()
                        }
                    }
                
                   

                Text("Reset")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
           
           
        }
        
        
        // example 1
        
//        Text(isComplete ? "COMPLETED" : "NOT COMPLETED")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? .green : .gray)
//            .cornerRadius(10)
////            .onLongPressGesture {
////                isComplete.toggle()
////            }
////            .onLongPressGesture(minimumDuration: 5.0) { // 5 sec
////                isComplete.toggle()
////            }
//        
//            .onLongPressGesture(minimumDuration: 5.0,maximumDistance: 50) { // 5 sec and // near distance 50
//                isComplete.toggle()
//            }
             
    }
}

#Preview {
    LogPressGestureDemo()
}
