//
//  SettingsView.swift
//  NotesAppSwiftUI
//
//  Created by Nikita Marin on 29.04.2023.
//

import SwiftUI

struct SettingsView: View {
    @Binding var compactCells: Bool
    var body: some View {
        List {
            Toggle("Compact cells", isOn: $compactCells)
        }
    }
}
