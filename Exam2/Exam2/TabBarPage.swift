//
//  TabBarPage.swift
//  Exam2
//
//  Created by Полина Рыфтина on 29.04.2023.
//

import SwiftUI

class Notesdata: ObservableObject {
    @Published var allNotes: [Note] = []
    @Published var favNotes: [Note] = []
}


struct TabBarPage: View {
    @ObservedObject
    var notesData: Notesdata = Notesdata()
    
    @ObservedObject
    var noteSettings: NoteSetting = NoteSetting()
    
    var body: some View {
        TabView {
            MainNotePage(
                notesData: notesData,
                noteSettings: noteSettings
            ).tabItem {
                Label("Notes", systemImage: "list.bullet.clipboard")
            }
            
            SettingsPage(noteSettings: noteSettings).tabItem {
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
