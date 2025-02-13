//
//  DownloadWithCombine.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/13/25.
//

import SwiftUI
import Combine

struct PostModel : Identifiable,Codable {
    var userId,id :Int
    var title : String
    var body : String
}

class DownloadWithCombineViewModel : ObservableObject {
    @Published var posts : [PostModel] = []
    var cancellabeles = Set<AnyCancellable>()
    
    init(){
        getPost()
    }
    
    func getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{ return }

        // Combine discussion
        /*
        //1. signup for monthly subscription for package to be deliverd
        //2. the company would make the package behind the scene
        //3. receive the package at your door
        //4. receive the box isn't damaged
        //5.open and make sure item is correct
        //6. use the item !!
        // 7. cancellable at any time.
        
        
       // how combine we have to do.

        // 1. create the publisher
        // 2. subscribe publisher on background thread
        // 3. receive on main thread
        // 4. trymap (check that data is good)
        // 5. decode data into postmodel
        // 6.  sink (put the item into our app)
        // 7.  store (cancel subscription if needed)
         
         */
        
        URLSession.shared.dataTaskPublisher(for: url)
            //.subscribe(on: DispatchQueue.global(qos: .background)) // no need to do this becuase datatask already
            .receive(on: DispatchQueue.main)
//            .tryMap { (data,response) -> Data in
//                
//                guard let response = response as? HTTPURLResponse,response.statusCode >= 200 && response.statusCode < 300 else {
//                    //error
//                    throw URLError(.badServerResponse)
//                }
//                // good response
//                return data
//            }
        
            .tryMap(handleOutout) // for sort
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case  .finished:
                    print("Completion: \(completion)")
                    
                case .failure(let error):
                    print("There was an error: \(error)")
                }
            } receiveValue: { [weak self] returnedPost in
                self?.posts = returnedPost
            }
            .store(in: &cancellabeles)
    }
    
    func handleOutout(_ output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,response.statusCode >= 200 && response.statusCode < 300 else {
            //error
            throw URLError(.badServerResponse)
        }
        // good response
        return output.data
    }
}

struct DownloadWithCombine: View {
    @StateObject var vm = DownloadWithCombineViewModel()

    
    var body: some View {
        List{
            ForEach(vm.posts){ post in
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    DownloadWithCombine()
}
