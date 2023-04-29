//
//  SettingsView.swift
//  kr2
//
//  Created by Rafael Shamsutdinov on 29.04.2023.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isCompact") var isCompact: Bool = false
    
    var body: some View {
        Form {
            
            Toggle(isOn: $isCompact) {
                Text("Компактные ячейки")
            }

            
        }
        .onChange(of: isCompact) { newValue in
                    UserDefaults.standard.set(newValue, forKey: "isCompact")
                }
        .background(Color(red: 239.0/255.0, green: 239.0/255.0, blue: 245.0/255.0))
    }
    
}

