//
//  ActionSheet.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 1/31/25.
//

import SwiftUI

struct ActionSheetDemo: View {
    @State var showActionSheet: Bool = false
    
    @State var actionSheetOption : ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions{
        case isMyPost
        case isOtherPost
    }
   
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30,height: 30)
                Text("@username")
                Spacer()
                Button {
                    actionSheetOption = .isMyPost
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .tint(.primary)
                }
            }
            .padding(.horizontal)
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
            
            
            
        }
        .actionSheet(isPresented: $showActionSheet, content:getActionSheet)

    }
    
    fileprivate func getActionSheet() -> ActionSheet {
       // return ActionSheet(title: Text("this is the title "))
        
//        let button1 :  ActionSheet.Button = .default(Text("My Favorite"))
//        
//        return ActionSheet(
//            title: Text("this is the title"),
//            message: Text("This is the message"),
//            buttons: [
//                button1,
//                .default(Text("Default")),
//                .destructive(Text("Destructive")),
//                .cancel()
//            ]
//        )
        
        let shareButton : ActionSheet.Button = .default(Text("Share")) {
            
        }
        
        let reportButton :  ActionSheet.Button = .destructive(Text("Report")) {
            
        }
        
        let deleteButton :  ActionSheet.Button = .destructive(Text("Delete")) {
            
        }
        
        let cancelButton :  ActionSheet.Button = .cancel(Text("Delete"))
        let title  = Text("This is the message")
        
        switch actionSheetOption {
        case .isMyPost:
            return ActionSheet(
                
                title: Text(""),
                        message: title,
                        buttons: [
                            shareButton,
                            deleteButton,
                            reportButton,
                            cancelButton
                        ]
                    )
        case .isOtherPost:
            return ActionSheet(
                title: title,
                        message: nil,
                        buttons: [
                            shareButton,
                            reportButton,
                            cancelButton
                        ]
                    )
        }
    }
}

#Preview {
    ActionSheetDemo()
}
