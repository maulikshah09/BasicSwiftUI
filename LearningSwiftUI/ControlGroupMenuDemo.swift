//
//  ControlGroupDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/5/25.
//

import SwiftUI

struct ControlGroupMenuDemo: View {
    var body: some View {
        Menu("My Menu"){
            ControlGroup("one"){
                Button("Uno"){
                    
                }
                Button("Dos"){
                    
                }
               
                Menu ("How are yoo") {
                    Button("Good"){
                        
                    }
                    Button("Bad"){
                        
                    }
                    
                }
            }
            Button("Two"){
                
            }
            Button("Three"){
                
            }
            
            Menu ("Three") {
                Button("HI"){
                    
                }
                Button("Hello"){
                    
                }
                Button("How Are you"){
                    
                }
                
                Menu ("Three") {
                    Button("Good"){
                        
                    }
                    Button("Bad"){
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ControlGroupMenuDemo()
}
