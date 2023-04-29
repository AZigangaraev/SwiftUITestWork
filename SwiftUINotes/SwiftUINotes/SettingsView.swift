//
//  SettingsView.swift
//  SwiftUINotes
//
//  Created by Эльвира Самигуллина on 29.04.2023.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isCompact: Bool

    var body: some View {
        List() {
            Toggle("Compact cells", isOn: $isCompact)
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
