//
//  noteApp.swift
//  note
//
//  Created by Элина Абдрахманова on 29.04.2023.
//

import SwiftUI

@main
struct noteApp: App {
    
    @State
    private var isActive = false
    
    var body: some Scene {
        WindowGroup {
            TabBarView(isActive: $isActive)
        }
    }
}
