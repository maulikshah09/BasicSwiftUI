//
//  WeakSelfDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/12/25.
//

import SwiftUI

struct WeakSelfDemo: View {
    @AppStorage("count") var count : Int?
    
    init() {
        self.count = 0
    }
    
    var body: some View {
         NavigationStack{
            
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(.green)
                .cornerRadius(10)
            
            NavigationLink(value: "moveto") {
                Text("Navigate")
            }
            
            .navigationTitle("screen 1")
            .navigationDestination(for: String.self) { value in
                WeakSelfSecondScreen()
            }
        }
    }
}

struct WeakSelfSecondScreen:View {
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        Text("Second View")
            .font(.largeTitle)
            .foregroundStyle(.red)
        
        if let data = vm.data{
            Text(data)
        }
    }
}

class WeakSelfSecondScreenViewModel : ObservableObject{
    @Published var data : String? = nil
    
    init() {
        print("Init")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit{
        print("Deinit")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() { // must be write [weak self] otherwise app class is not deinit
        DispatchQueue.main.asyncAfter(deadline: .now() + 500){ [weak self] in
            self?.data = "New data"
        }
    }
}

#Preview {
    WeakSelfDemo()
}
