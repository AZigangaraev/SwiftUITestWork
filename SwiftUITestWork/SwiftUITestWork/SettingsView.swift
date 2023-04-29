//
//  SettingsView.swift
//  SwiftUITestWork
//
//  Created by Alsu Faizova on 29.04.2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var isCompactNotes: Bool = false
    
    var body: some View {
        VStack {
            Toggle("Compact notes", isOn: $isCompactNotes)
            Spacer()
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
