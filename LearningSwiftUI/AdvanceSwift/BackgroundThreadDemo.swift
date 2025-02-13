//
//  BackgroundThreadDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/12/25.
//

import SwiftUI

class BackgroundThreadViewModel : ObservableObject{
    @Published var dataArray : [String] = []
    
    func featchData() {
        DispatchQueue.global(qos: .background).async { ///
            let newdata = self.downloadData()
            
            print("Check 1: \(Thread.isMainThread)") // to check main thread
            print("Check 1: \(Thread.current)")
            
            
            DispatchQueue.main.async {
                self.dataArray = newdata
                print("Check 2: \(Thread.isMainThread)")
                print("Check 2: \(Thread.current)")
            }
        }
    }
    
     
//    func fetchData() {
//        Task {
//            let newData = await fetchInBackground()
//            await MainActor.run {
//                self.dataArray = newData
//            }
//        }
//    }
//
//    private func fetchInBackground() async -> [String] {
//        return await Task.detached { [weak self] in
//            guard let self = self else { return [] } // Prevent crash if `self` is nil
//            return self.downloadData()
//        }.value
//    }
    
    private func downloadData() -> [String] {
        var data : [String] = []
        
        for x in 0..<100{
            data.append("\(x)")
            print(data)
        }
        
        return data
    }
}

struct BackgroundThreadDemo: View {
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing : 10){
                Button("Load Data") {
                    vm.featchData()
                }
                .font(.largeTitle)
                .fontWeight(.semibold)
    
                
                ForEach(vm.dataArray,id : \.self){ item  in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    BackgroundThreadDemo()
}
