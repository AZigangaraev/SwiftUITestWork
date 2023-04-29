//
//  TabBarView.swift
//  SwiftUINotes
//
//  Created by Эльвира Самигуллина on 29.04.2023.
//

import SwiftUI

struct TabBarView: View {
    @Binding var isCompact: Bool
 
    var body: some View {
        TabView {
            NotesView(isCompact: $isCompact).tabItem {
                Label("Notes", systemImage: "note")
            }

            SettingsView(isCompact: $isCompact).tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}
