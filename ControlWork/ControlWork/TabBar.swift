//
//  TabBar.swift
//  ControlWork
//
//  Created by Карина Хайрулина on 29.04.2023.
//

import SwiftUI

struct TabBar: View {
    
    @State var showTabBar: Bool = true
    @State var notes: [Note] = []
    @StateObject var settings = Settings()
    
    var body: some View {
        TabView {
            NotesView(showTabBar: $showTabBar, notes: $notes)
                .environmentObject(settings) 
                .tabItem {
                    Label("Notes", systemImage: "list.bullet")
                }
            
            SettingsView(showTabBar: $showTabBar)
                .environmentObject(settings)
                .tabItem {
                    Label("Settings", systemImage: "slider.horizontal.3")
                }
        }
    }
}

