//
//  ContentView.swift
//  NotesAppSwiftUI
//
//  Created by Nikita Marin on 29.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State var compactCells = true
    var body: some View {
        TabView {
            NotesView(compactCells: $compactCells).tabItem {
                Label("Notes", systemImage: "note")
            }
            SettingsView(compactCells: $compactCells).tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}

