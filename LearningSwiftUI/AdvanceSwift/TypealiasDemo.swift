//
//  Typealias.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/12/25.
//

import SwiftUI

struct MovieModel{
    let title: String
    let direct : String
    let count : Int
}

typealias TVModel = MovieModel

struct TypealiasDemo: View {
   // @State var item : MovieModel = MovieModel(title: "Title", direct: "joe", count: 6)
    
    @State var item  : TVModel = TVModel(title: "tv title", direct: "emily", count: 10)
    
    var body: some View {
        VStack{
            Text(item.title)
            Text(item.direct)
            Text("\(item.count)")
        }
        
      
    }
}

#Preview {
    TypealiasDemo()
}
