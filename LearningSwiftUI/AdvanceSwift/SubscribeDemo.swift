//
//  SubscribeDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/14/25.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject{
    @Published var count = 1
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText = ""
    @Published var textIsValid: Bool = false
    @Published var showButton = false
    
    init(){
        setupTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { text -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
            .sink { [weak self] valid in
                self?.textIsValid = valid
            }
           // .assign(to: \.textIsValid, on: self) // this is not good because we can't do weak self.
            .store(in: &cancellables)
    }
   
    func setupTimer () {
      Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self]_ in
                guard let self = self else{return }
                self.count +=  1
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink { [weak self](isValid,count) in
                guard let self = self else{ return}
                if isValid && count >= 10{
                    self.showButton = true
                }else{
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
}

struct SubscribeDemo: View {
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack{
            Text("\(vm.count)")
                .font(.largeTitle)
            
            Text(vm.textIsValid.description)
            
            TextField("Type something here...",text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .font(.headline)
                .background(.gray.opacity(0.50))
                .cornerRadius(10)
                .overlay (
                    ZStack{
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                            .opacity(vm.textFieldText.count < 1 ? 0.0 :
                                vm.textIsValid ? 0.0 : 1.0)
                        
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .opacity(vm.textIsValid ? 1.0 : 0.0)
                        
                    }
                     
                    .font(.headline)
                    .padding(.trailing)
                    ,alignment: .trailing
                )
            
            
            Button {
                
            } label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
                    .opacity(vm.showButton ? 1.0 : 0.5)
            }
            .disabled(!vm.showButton)

        }
        .padding()
    }
}

#Preview {
    SubscribeDemo()
}
