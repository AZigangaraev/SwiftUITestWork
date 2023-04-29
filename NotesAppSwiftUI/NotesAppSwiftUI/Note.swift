//
//  Note.swift
//  NotesAppSwiftUI
//
//  Created by Nikita Marin on 29.04.2023.
//

import Foundation

struct NoteSection: Identifiable {
    let id: UUID
    var name: String
    var items: [Note]
}
struct Note: Identifiable {
    let id: UUID
    var title: String
    var isFavourite: Bool
    var description: String?
    
    mutating func toogleFav() {
        isFavourite.toggle()
    }
}

