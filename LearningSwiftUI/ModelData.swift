//
//  ModelData.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName:String
    let followerCount : Int
}

struct ModelData: View {
    
    @State var users : [UserModel] = [
        UserModel(displayName: "Maulik", userName: "maulik_shah", followerCount: 1000),
        UserModel(displayName: "Ankit", userName: "Ankit_shah", followerCount: 900),
        UserModel(displayName: "samantha", userName: "samntha_patel", followerCount: 1500),
        UserModel(displayName: "payal", userName: "payal", followerCount: 200),
        UserModel(displayName: "jalay", userName: "jalay", followerCount: 500)
    ]
    var body: some View {
        NavigationStack{
            List{
                ForEach(users) { user in
                    HStack {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text("\(user.displayName)")
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        VStack{
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                    }.padding(.vertical,10)
                }

            }
            .listStyle(.insetGrouped)
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ModelData()
}
