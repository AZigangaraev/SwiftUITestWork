//
//  SettingsView.swift
//  note
//
//  Created by Илья on 29.04.2023.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isCompact: Bool
    
    var body: some View {
        Form {
            Section(header: Text("Note Size")) {
                Toggle(isOn: $isCompact) {
                    Text("Compact")
                }
            }
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isCompact: .constant(false))
    }
}
