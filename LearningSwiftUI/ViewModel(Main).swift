//
//  StateObjectObservableObject.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

// Model
struct FruitModel : Identifiable{
    let id = UUID().uuidString
    let name: String
    let count: Int
}

// ViewModel
//Observable // from ios 17
class FruitViewModel : ObservableObject{
    
    @Published var arrFruits : [FruitModel] = []
    @Published var isLoading = false
    
    init (){
        getFruits()
    }
    
    func addItem(){
        let fruit = FruitModel(name: "Parry", count: 8)
        arrFruits.append(fruit)
    }
    
    func delete(index: IndexSet){
        arrFruits.remove(atOffsets: index)
    }

    func getFruits(){
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 88)
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            
            self?.arrFruits.append(fruit1)
            self?.arrFruits.append(fruit2)
            self?.arrFruits.append(fruit3)
            self?.isLoading = false
        }
    }
}

//view
struct ViewModel: View {
    
    // @StateObject  ->  use this on creation / init
    // @observedObject -> use this for subview 
    
    @ObservedObject var fruitViewModel = FruitViewModel()
  
    var body: some View {
        NavigationStack{
            ZStack{
                if fruitViewModel.isLoading {
                    ProgressView()
                }else{
                    List{
                        ForEach(fruitViewModel.arrFruits){ fruit in
                            HStack{
                                Text("\(fruit.count)")
                                    .foregroundStyle(.red)
                                
                                Text(fruit.name)
                                    .font(.headline)
                                    .bold()
                            }
                        }
                        .onDelete(perform: fruitViewModel.delete)
                    }
                    .listStyle(.grouped)
                }
            }
            
            .navigationTitle("Fruit List")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(value:"move"){
                        Image(systemName: "arrow.right")
                            .font(.title)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        fruitViewModel.addItem()
                    } label: {
                        Text("Add Item")
                            .font(.headline)
                    }

                }
            }
            .navigationDestination(for: String.self) { value in
                if value == "move" {
                    SecondScreenView(fruitViewModel: fruitViewModel)
                }
            }
        }
    }
}

struct SecondScreenView : View{
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel : FruitViewModel
    
    var body: some View{
        ZStack{
            Color.green
                .ignoresSafeArea()
            
           
            VStack{
                ForEach(fruitViewModel.arrFruits){
                    fruit in
                    Text(fruit.name)
                        .foregroundStyle(.white)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    ViewModel()
}
