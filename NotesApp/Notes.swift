//
//  Notes.swift
//  NotesApp
//
//  Created by Лена Гусарова on 29.04.2023.
//

import Foundation

struct Note: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var content: String
    var creationDate: Date
    var isFavorite = false
    
    static func ==(lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id
    }
}


class NoteStore: ObservableObject {
    @Published var notes: [Note] = []

    func addOrUpdate(_ note: Note) {
        if let index = self.notes.firstIndex(of: note) {
            self.notes[index] = note
        } else {
            self.notes.append(note)
        }
    }
}


