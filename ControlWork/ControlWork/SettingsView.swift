//
//  SettingsView.swift
//  ControlWork
//
//  Created by Карина Хайрулина on 29.04.2023.
//

import SwiftUI

class Settings: ObservableObject {
    @Published var compactCells = false
}

struct SettingsView: View {
    @Binding var showTabBar: Bool
    @EnvironmentObject var settings: Settings

    var body: some View {
        VStack {
            Toggle(isOn: $settings.compactCells) {
                Text("Compact cells")
            }
            Spacer()
        }
    }
}



