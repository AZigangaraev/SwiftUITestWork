//
//  SwiftUINotesApp.swift
//  SwiftUINotes
//
//  Created by Эльвира Самигуллина on 29.04.2023.
//

import SwiftUI

@main
struct SwiftUINotesApp: App {
    @State var isCompact: Bool = true
    
    var body: some Scene {
        WindowGroup {
            TabBarView(isCompact: $isCompact)
        }
    }
}
