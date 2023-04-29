//
//  ContentView.swift
//  kr2
//
//  Created by Rafael Shamsutdinov on 29.04.2023.
//

import SwiftUI
struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NoteList()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Заметки")
                }
                .tag(0)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Настройки")
                }
                .tag(1)
        }
        .environmentObject(NoteStore())

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NoteList()
    }
}
