//
//  SettingsView.swift
//  ControlWork2
//
//  Created by Радмир Фазлыев on 29.04.2023.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isCompactModeEnabled") private var isCompactModeEnabled = false
    
    var body: some View {
        Form {
            Toggle(isOn: $isCompactModeEnabled) {
                Text("Compact Sells")
            }
        }
    }
}
