//
//  DownloadWithEscapingDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/13/25.
//

import SwiftUI

struct PostModel : Identifiable,Codable {
    var userId,id :Int
    var title : String
    var body : String
}

class DownloadWithEscapingViewModel: ObservableObject{
    @Published var posts: [PostModel] = []
    
    init(){
        getPost()
    }
    
    func getPost(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{ return }
        
        downloadData(fromUrl: url) { [weak self] returnData in
            if let data = returnData{
                do {
                    let newPost = try JSONDecoder().decode([PostModel].self, from: data)
                }
                
                catch let DecodingError.typeMismatch(type, context) {
                        print("Type mismatch for type \(type) - \(context.debugDescription)")
                    } catch {
                        print("Decoding failed: \(error.localizedDescription)")
                    }
                
                guard let newPost = try? JSONDecoder().decode([PostModel].self, from: data) else{
                    print("errorr")
                    return }
               
                DispatchQueue.main.async{ [weak self] in
                    self?.posts = newPost
                }
            }
                
        }
    }
    
    func downloadData(fromUrl : URL, completion: @escaping(_ data : Data?) -> Void)  {
        
        URLSession.shared.dataTask(with:fromUrl) { data, response, error in
            guard let data = data else{
                print("NO data")
                completion(nil)
                return
            }
            
            guard error == nil else{
                print("error : \(String(describing: error))")
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse else{
                print("Invalid response")
                completion(nil)
                return
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else{
                print("status code should be 2xx, but is \(response.statusCode)")
                completion(nil)
                return
            }
            
            
            completion(data)
        }
        .resume()
    }
}

struct DownloadWithEscapingDemo: View {
    
    @StateObject var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        List{
            ForEach(vm.posts){ post in
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                    .foregroundStyle(.gray)
            }
        }.listStyle(.plain)
        
    }
}

#Preview {
    DownloadWithEscapingDemo()
}
