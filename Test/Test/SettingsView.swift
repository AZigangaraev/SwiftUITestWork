//
//  SettingsView.swift
//  Test
//
//  Created by Максим Тарасов on 29.04.2023.
//

import SwiftUI

struct SettingsView: View {
    @Binding var toggleIsOn: Bool
    
    var body: some View {
        List {
            Section {
                Toggle(isOn: $toggleIsOn, label: {
                    Text("Compact cells")
                })
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let binding = Binding<Bool>(get: { false }, set: { _ in })
            return
        SettingsView(toggleIsOn: binding)
    }
}
