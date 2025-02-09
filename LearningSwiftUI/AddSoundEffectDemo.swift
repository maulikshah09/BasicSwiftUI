//
//  AddSoundDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/9/25.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    private init(){}
    
    enum SoundOption: String{
        case tada
        case badum
    }
    
    func playSound(sound : SoundOption) {
        guard let url =  Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else{ return}
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }
        catch let error{
            print("error playing sound. \(error.localizedDescription)")
        }
    }
    
}

struct AddSoundDemo: View {
 
    var body: some View {
        VStack(spacing: 40){
            Button("Play Sound 1"){
                SoundManager.instance.playSound(sound:.tada)
            }
            
            Button("Play Sound 2"){
                SoundManager.instance.playSound(sound:.badum)
            }
        }
    }
}

#Preview {
    AddSoundDemo()
}
