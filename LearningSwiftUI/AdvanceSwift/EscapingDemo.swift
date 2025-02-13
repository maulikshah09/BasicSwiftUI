//
//  EscapingDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/12/25.
//

import SwiftUI

class EscapingViewModel : ObservableObject {
    @Published var text : String = "hello"
    
    func getData(){
        downloadData5 { [weak self] returnResult in
            self?.text = returnResult.data
        }
    }
    
    func downloadData() -> String {
        return "New data!"
    }
    
    
    func downloadData2(complition : (_ data : String) -> Void){
        
        complition("new data") // nonescaping
    }
    
    //escaping
    func downloadData3(complition :@escaping (_ data : String) -> Void){

        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
            complition("new data!!!!") // nonescaping
        }
    }
    
    func downloadData4(complition :@escaping (DownloadResult) -> Void){

        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
            let result = DownloadResult(data: "new data maulik")
            
            complition(result) // nonescaping
        }
    }
    
    //typealias
    func downloadData5(complition :@escaping(downloadData)){

        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
            let result = DownloadResult(data: "new data maulik")
            
            complition(result) // nonescaping
        }
    }
}

struct DownloadResult {
    let data : String
}

typealias downloadData = (DownloadResult) -> Void

struct EscapingDemo: View {
    @StateObject var viewModel = EscapingViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .onAppear{
                viewModel.getData()
            }
    }
}

#Preview {
    EscapingDemo()
}
 
