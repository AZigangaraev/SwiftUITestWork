//
//  ContentView.swift
//  SwiftUITestWork
//
//  Created by Alsu Faizova on 29.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                MainView()
                    .tabItem {
                        Label("Notes", systemImage: "note.text")
                    }
                    .environmentObject(NoteList())
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
