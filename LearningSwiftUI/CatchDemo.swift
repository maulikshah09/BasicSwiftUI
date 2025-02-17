//
//  CatchDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/18/25.
//
import SwiftUI

class CacheManager {
    static let instance = CacheManager()
    
    private init(){   }
    
    var imageCache : NSCache<NSString,UIImage> = {
        let cache = NSCache<NSString,UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024  * 100 // 100 mb
        return cache
    }()
    
    func add(image: UIImage,name: String){
        imageCache.setObject(image, forKey: name as NSString)
        print("Added to cache")
    }
    
    func remove(name: String){
        imageCache.removeObject(forKey: name as NSString)
        print("remove cache")
    }
    
    func get(name: String)-> UIImage?{
        return imageCache.object(forKey: name as NSString)
    }
    
}

class CatchViewModel: ObservableObject{
    @Published var startingImage : UIImage? = nil
    @Published var catchImage: UIImage? = nil
    
    let imageName = "Steave-Jobs"
    let manager = CacheManager.instance
    
    init() {
        getImageFromAssestFolder()
    }
    
    func getImageFromAssestFolder () {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache(){
        guard let image = startingImage else {
            return
        }
        manager.add(image: image, name: imageName)
    }
    
    func removeFromCache(){
        manager.remove(name: imageName)
    }
    
    func getFromCache(){
        catchImage = manager.get(name: imageName)
        
    }
}

struct CatchDemo: View {
    @StateObject var vm = CatchViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                
                if let image = vm.startingImage{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
               
                
                
                HStack {
                    Button{
                        vm.saveToCache()
                    }label: {
                        Text("Save to cache")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    
                    Button{
                        vm.removeFromCache()
                    }label: {
                        Text("Delete from cache")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.red)
                            .cornerRadius(10)
                    }
                   
                }
                
                Button{
                    vm.getFromCache()
                }label: {
                    Text("get from cache")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.green)
                        .cornerRadius(10)
                }
                
                if let image = vm.catchImage{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                Spacer()
            }
            
            .navigationTitle("Cache demo")
        }
    }
}

#Preview {
    CatchDemo()
}
