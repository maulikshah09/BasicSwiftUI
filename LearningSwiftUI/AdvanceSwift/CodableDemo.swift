//
//  Codable.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/13/25.
//

import SwiftUI

//codable = decodable,encodeable

struct CustomerModel: Identifiable,Codable {
    let id :String
    let name : String
    let points : Int
    let isPremium : Bool
    
    enum CodingKeys : String,CodingKey{
        case id
        case name
        case points
        case isPremium //= "is_premium"
    }
    
    init(id:String,name:String,points:Int,isPremium:Bool){
        self.id = id
        self.name = name
        self.points = points
        self.isPremium = isPremium
    }
    
    init(from decorder: Decoder) throws{
        let container = try decorder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.points = try container.decode(Int.self, forKey: .points)
        
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(points, forKey: .points)
        try container.encode(isPremium, forKey: .isPremium)
    }
}

class CodableViewModel: ObservableObject{
    @Published var customer: CustomerModel? =  nil
    
    init(){
        getData()
    }
    
    func getData(){
        guard let data = getJsonData() else{
            return
        }
        print("Json data")
        print(data)
//        let jsonString = String(data: data, encoding: .utf8)
//        print(jsonString)
        
        // normal decode
        
//        let localData = try? JSONSerialization.jsonObject(with: data, options: [])
//        let dictioary = localData as? [String: Any]
 //        let id  = dictioary["id"] as? String
//         let name = dictioary["id"] as? String
        
        
        //codable
        
        do{
            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
        }
        catch let error{
            print("Error Decoding. \(error)")
        }
    }
    
    func getJsonData() -> Data? {
      
       // dictionary way
        //let dictionary : [String: Any] = ["id" : "12345", "name":"maulik","points" : 5, "isPremium" : true]
        //        let jsonData = try? JSONSerialization.data(withJSONObject:dictionary , options: [])
        
        
        
        // encodable way
        let customer = CustomerModel(id:"1234", name:"maulik", points:130, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)

        return jsonData
    }
}

struct CodableDemo: View {
    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = vm.customer{
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableDemo()
}
