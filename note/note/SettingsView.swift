//
//  SettingsView.swift
//  note
//
//  Created by Элина Абдрахманова on 29.04.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding
    var isActive: Bool
    
    @EnvironmentObject
    var navigationObject: NavigationObject
    
    @State
    private var isCompact: Bool = false
    
    var body: some View {
        VStack{
            List {
                Section(header: Text("")) {
                    Toggle(isOn: $isCompact) {
                        Text("Compact cells")
                    }
                }
                
                Section(header: Text("Toggle не сделала")) {
                    Image("sad")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        
    }
}


