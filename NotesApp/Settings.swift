//
//  Settings.swift
//  NotesApp
//
//  Created by Лена Гусарова on 29.04.2023.
//

import SwiftUI

struct SettingsView: View {
    @Binding var cellSize: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Cell Size")
                .font(.headline)
            Slider(value: $cellSize, in: 50...100, step: 5)
        }
        .padding()
        .navigationTitle("Settings")
    }
}

