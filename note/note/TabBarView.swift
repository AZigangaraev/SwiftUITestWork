//
//  TabBarView.swift
//  note
//
//  Created by Элина Абдрахманова on 29.04.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding
    var isActive: Bool
    
    @EnvironmentObject
    var navigationObject: NavigationObject
    
    var body: some View {
        NavigationView {
            TabView {
                NotesView()
                    .tabItem {
                        Label("", systemImage: "envelope")
                    }
                SettingsView(isActive: $isActive)
                    .tabItem {
                        Label("", systemImage: "gear")
                    }
            }
            .accentColor(Color.blue)
        }
    }
}
