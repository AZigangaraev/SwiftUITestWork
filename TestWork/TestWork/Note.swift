//
//  Note.swift
//  TestWork
//
//  Created by Artyom Tabachenko on 29.04.2023.
//

import Foundation
import SwiftUI

struct Note: Identifiable, Hashable  {
    var id: String = UUID().uuidString
    var noteTitle: String = ""
    var noteBody: String = ""
    var isFavorite: Bool = false
}


class NotesViewModel: ObservableObject {
    @Published
    var notes = [
        Note(noteTitle: "Title", noteBody: "Body")
    ]
    
    
    @Published var isFavorite = false
    
    func addNote(title: String, text: String) {
        notes.append(Note(noteTitle: title, noteBody: text))
    }
    
    func filteredNotes() -> [Note] {
        if isFavorite {
            return notes.filter({$0.isFavorite})
        } else {
            return notes
        }
    }
    
    func allNotes() -> [Note] {
        return notes
    }
    
    func toggleFavorite(note: Note) {
        if let index = notes.firstIndex(where: {$0.id == note.id}) {
            notes[index].isFavorite.toggle()
        }
    }
}
