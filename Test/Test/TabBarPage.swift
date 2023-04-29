//
//  TabBarPage.swift
//  Test
//
//  Created by Daniil Chemaev on 29.04.2023.
//

import SwiftUI

struct TabBarPage: View {

    var body: some View {
        TabView {
            MainPage()
                .tabItem {
                Label("Notes", systemImage: "note")
            }
                .environmentObject(NotesList())

            SettingsPage().tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}

struct TabBarPage_Previews: PreviewProvider {
    static var previews: some View {
        TabBarPage()
    }
}

