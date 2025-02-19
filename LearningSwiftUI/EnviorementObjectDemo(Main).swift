//
//  EnviorementObject.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/2/25.
//

import SwiftUI

class EnviorementViewModel: ObservableObject{
    @Published var arrData : [String] = []
    
    init(){
        getData()
    }
    
    func getData(){
        self.arrData.append(contentsOf: ["iPhone", "iPad","iMac","Apple Watch"])
    }
}

struct EnviorementObjectDemo: View {
    
    @StateObject var viewModel : EnviorementViewModel = EnviorementViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.arrData,id: \.self){ item in
                    
                    NavigationLink(value: item) {
                        Text(item)
                            .font(.headline)
                            .foregroundStyle(.green)
                            .padding()
                    }
                    
                }
            }
            .navigationTitle("iOS Devices")
            .navigationDestination(for: String.self) { value in
                if value == "FinalView" {
                    FinalView()
                }else{
                    DetailView(selectedItem: value)
                }
            }
        }
        .environmentObject(viewModel)
    }
}

struct DetailView: View {
    let selectedItem: String
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Spacer() // Pushes the button towards the center

                NavigationLink(value:"FinalView") {
                    Text(selectedItem)
                        .font(.headline)
                        .foregroundStyle(.orange)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(30)
                }
                
                Spacer() // Allows proper spacing
            }
        }
        .navigationTitle("Detail View")
    }
}


struct FinalView:View {
     
    @EnvironmentObject var viewmodel : EnviorementViewModel
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView{
                VStack(spacing: 20) {
                    ForEach(viewmodel.arrData,id: \.self){item in
                        Text(item)
                    }
                }
                .foregroundStyle(.white)
                .font(.largeTitle)
            }
            
        }
    }
}

#Preview {
    EnviorementObjectDemo()
}
