//
//  SettingsPage.swift
//  Exam2
//
//  Created by Полина Рыфтина on 29.04.2023.
//

import SwiftUI

class NoteSetting: ObservableObject {
    @Published var showCompactCell = false
}

struct SettingRow: View {
    @ObservedObject
    var noteSettings: NoteSetting

    var body: some View {
        List {
            Toggle("Compact page", isOn: $noteSettings.showCompactCell)
        }
    }
}

struct SettingsPage: View {
    @ObservedObject
    var noteSettings: NoteSetting
    
    var body: some View {
        SettingRow(noteSettings: noteSettings)
    }
    
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage(noteSettings: NoteSetting())
    }
}
