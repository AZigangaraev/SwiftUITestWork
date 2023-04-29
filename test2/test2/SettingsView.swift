//
//  SettingsView.swift
//  test2
//
//  Created by macbook Denis on 4/29/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var defaultCell: Bool
    
    var body: some View {
        VStack {
            Toggle(isOn: $defaultCell) {
                    Text("Compact cells")
                }
            Spacer()
        }
    }
}
