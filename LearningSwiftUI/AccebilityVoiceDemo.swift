//
//  AccebilityVoiceDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/17/25.
//

import SwiftUI

struct AccebilityVoiceDemo: View {
    @State var isToggle = false
    
    var body: some View {
        NavigationStack{
            Form{
                
                Section {
                    Toggle("Volume", isOn:$isToggle)
                    
                    HStack{
                        Text("Volume")
                        Spacer()
                        Text(isToggle ? "TRUE": "FALSE")
                            .accessibilityHidden(true)
                    }
                    .background(.black.opacity(0.1))
                    .onTapGesture {
                        isToggle.toggle()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityValue(isToggle ? "is on": "is off")
                    .accessibilityHint("Double tap to toggle settings.")
                    .accessibilityAction{
                        isToggle.toggle()
                    }
                    
                } header: {
                    Text("PREFERENCE")
                }
               
                Section {
                    Button("Favorites"){
                        
                    }
                    .accessibilityRemoveTraits(.isButton)
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "heart.fill")
                    }
                    .accessibilityLabel("Favorites")
                    
                    Text("Favorite")
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture {
                            
                        }
                } header: {
                    Text("APPLICATION")
                }

                VStack{
                    Text("Content")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                        .accessibilityAddTraits(.isHeader) // add in to headers
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(0..<10){ x in
                                VStack{
                                    Image("Steave-Jobs")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                    
                                    Text("Item \(x)")
                                }.onTapGesture {
                                
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityAddTraits(.isButton)
                                .accessibilityLabel("Item \(x). Image of steave jobs")
                                .accessibilityHint("Double tap to open")
                                .accessibilityAction{
                                    
                                }
                            }
                        }
                    }

                }
            }
            
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    AccebilityVoiceDemo()
}
