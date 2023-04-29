//
//  ContentView.swift
//  ControlWork2
//
//  Created by Радмир Фазлыев on 29.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            
            NoteListView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Notes")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
    }
}
