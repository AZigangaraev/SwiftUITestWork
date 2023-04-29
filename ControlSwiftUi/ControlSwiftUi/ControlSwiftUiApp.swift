//
//  ControlSwiftUiApp.swift
//  ControlSwiftUi
//
//  Created by Лада on 29.04.2023.
//

import SwiftUI

@main
struct ControlSwiftUiApp: App {
    let store = NoteStore()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(store)
        }
    }
}

