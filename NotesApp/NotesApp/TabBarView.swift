//
//  TabBarView.swift
//  NotesApp
//
//  Created by Илья Казначеев on 29.04.2023.
//

import SwiftUI

class NoteSettings: ObservableObject {
    @Published var on = true
}


struct TabBarView: View {
    
    @StateObject var settings = NoteSettings()
    
    var body: some View {
        TabView {
            TestCollectionView()
                .tabItem {
                    Text("Notes")
                    Image(systemName: "note")
                }
                .environmentObject(settings)
            SettingsView()
                .tabItem {
                    Text("Settings")
                    Image(systemName: "gear")
                }
                .environmentObject(settings)
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
