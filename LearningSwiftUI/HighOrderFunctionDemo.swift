//
//  HighOrderFunctionDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/10/25.
//

import SwiftUI

struct UserModelInfo : Identifiable{
    let id = UUID().uuidString
    let name : String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationModel : ObservableObject{
    @Published var dataArray : [UserModelInfo] = []
    @Published var filteredArray : [UserModelInfo] = []
    @Published var mappArray : [String] = []
    
    init(){
        getUsers()
        updatefiltered()
    }
    
    func getUsers(){
        let user1 = UserModelInfo(name: "maulik", points: 5, isVerified: true)
        let user2 = UserModelInfo(name: "Nick", points: 3, isVerified: false)
        let user4 = UserModelInfo(name: "Chris", points: 25, isVerified: true)
        let user5 = UserModelInfo(name: "joe", points: 35, isVerified: false)
        let user6 = UserModelInfo(name: "ew", points: 52, isVerified: false)
        let user7 = UserModelInfo(name: "samantha", points: 25, isVerified: true)
        let user8 = UserModelInfo(name: "ewr", points: 34, isVerified: true)
        let user9 = UserModelInfo(name: "Lisa", points: 10, isVerified: false)
        let user10 = UserModelInfo(name: "steav", points: 2, isVerified: false)
        
        self.dataArray.append(contentsOf: [user1,user2,user4,user5,user6,user7,user8,user9,user10])
    }
    
    func updatefiltered (){
        //sort
        //filter
        // map
        
        
// sort
        
        //way 1
//        filteredArray = dataArray.sorted { (user1,user2) -> Bool in
//            return user1.points < user2.points
//        }
        
        //way 2
//        filteredArray = dataArray.sorted(by: {$0.points > $1.points})
        
        
        
// Filter
        
        // way 1
//        filteredArray = dataArray.filter({ users -> Bool in
//            //return users.points > 50
//            return users.isVerified
//        })
        
        
         //way 2
//        filteredArray = dataArray.filter{$0.isVerified}
        
        
// map
        
    //way1
//        filteredArray =  dataArray.map({ user -> UserModelInfo in
//            return UserModelInfo(name: user.name, points: user.points * 2, isVerified: user.isVerified)
//        })
        
//      // way2
//        filteredArray = dataArray.map{
//            UserModelInfo(name: $0.name, points: $0.points * 2, isVerified: $0.isVerified)
//        }
        
        // it return userModel info with if nil then shows error and string is optional
        
//        mappArray = dataArray.map {$0.name} // it retun string array
        
        
        
        // compact map
        mappArray = dataArray.compactMap {$0.name}
        // it return only string without nil
        
    }
    
}

struct HighOrderFunctionDemo: View {
    @StateObject var vm = ArrayModificationModel()
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                ForEach(vm.filteredArray){ user in
                    VStack(alignment: .leading){
                        Text(user.name)
                        HStack{
                            Text("Points : \(user.points)")
                            Spacer()
                            if user.isVerified{
                                Image(systemName: "flame.fill")
                            }
                        }
                    }
                    .foregroundStyle(.white)
                    .padding()
                        .background(.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    HighOrderFunctionDemo()
}
