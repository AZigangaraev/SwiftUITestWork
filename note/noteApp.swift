//
//  noteApp.swift
//  note
//
//  Created by Илья on 29.04.2023.
//

import SwiftUI

@main
struct noteApp: App {
    let noteStore = NoteStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(noteStore)
        }
    }
}
