//
//  FileManagerDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/18/25.
//

import SwiftUI

class LocalFileManager{
    static let instance = LocalFileManager()
    let folderName = "MyApp_Images"
    private init(){
        createFolder()
    }
    
    func createFolder() {
        guard let pathe = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(folderName).path else{ return }
        if !FileManager.default.fileExists(atPath: pathe){
            do{
                try FileManager.default.createDirectory(atPath: pathe, withIntermediateDirectories: true,attributes: nil)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    
    func deleteFolder() {
        guard let pathe = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(folderName).path else{ return }
       
             do{
                 try FileManager.default.removeItem(atPath: pathe)
                 print("Delete folder")
            }catch{
                print(error.localizedDescription)
            }
        
    }
    
    func saveImage(image: UIImage,name : String) -> String{
       // image.jpegData(compressionQuality: 1.0)
        guard let data =  image.pngData(),let pathImage = getPathForImage(name: name) else{
            return "Error getting data"
            
        }
        
        do {
            try data.write(to: pathImage)
            print(pathImage)
            return "Success saving"
        }catch {
            print(error.localizedDescription)
            return "Error Saving"
        }
    }
    
    func getImage(name:String) -> UIImage? {
        guard let pathImage = getPathForImage(name: name)?.path,FileManager.default.fileExists(atPath: pathImage)
        else {
            return nil
        }
        return UIImage(contentsOfFile: pathImage)
    }
    
    func getPathForImage(name: String) -> URL?{
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(folderName)
            .appendingPathComponent(name+".png")
             
        else{
            return  nil
        }
        return path
    }
    
    func deleteImage (name : String) -> String{
        guard let path = getPathForImage(name: name),FileManager.default.fileExists(atPath: path.path) else{
             
            return "Error getting path"
        }
        
        do {
            try FileManager.default.removeItem(at: path)
            return "Remove successful"
            
        }catch{
            print(error.localizedDescription)
            return "Error deleting image.."
        }
    }
}

class FileManagerViewModel : ObservableObject{
    
    @Published var infoMessage = ""
    @Published var image: UIImage? = nil
    let imageName = "Steave-Jobs"
    let manager = LocalFileManager.instance
    
    init(){
        getImageFromAssetFolder()
        
       // getImageFromFileManager()
    }
    
    func getImageFromAssetFolder () {
        image = UIImage(named:imageName)
    }
    
    func saveImage() {
        guard let image = image else{ return}
        infoMessage = manager.saveImage(image:image , name: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func deleteImage(){
        infoMessage = manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }

}

 
struct FileManagerDemo: View {
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200,height: 200)
                        .clipped()
                        .cornerRadius(20)
                }
                
              
                HStack {
                    Button{
                        vm.saveImage()
                    } label: {
                        Text("Save to FM")
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    
                    Button{
                        vm.deleteImage()
                    } label: {
                        Text("Delete From FM")
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .cornerRadius(10)
                    }
                }
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

#Preview {
    FileManagerDemo()
}
