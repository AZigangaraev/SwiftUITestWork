//
//  SettingsView.swift
//  ControlSwiftUi
//
//  Created by Лада on 29.04.2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var isOn = false
       
    var body: some View {
        List {
            Toggle(isOn: $isOn) {
                Text("Compact cells")
            }
        }
        .navigationBarTitle("Настройки")
        .navigationBarItems(trailing:
            Button(action: {
                // Действие кнопки
            }) {
                if isOn {
                    Text("Включено")
                } else {
                    Text("Выключено")
                }
            }
        )
    }
}
