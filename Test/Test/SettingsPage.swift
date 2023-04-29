//
//  SettingsPage.swift
//  Test
//
//  Created by Daniil Chemaev on 29.04.2023.
//

import SwiftUI

struct SettingsPage: View {
    @State private var isCompactNotes: Bool = false

    var body: some View {
        VStack {
            Toggle("Compact notes", isOn: $isCompactNotes)
                .padding(10)
            Spacer()
        }
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
