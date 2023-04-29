import SwiftUI
import Foundation

class NotesViewModel: ObservableObject {
    @Published var notes = [
        Note(title: "First Note", text: "some text"),
        Note(title: "Third Note", text: "even more text")
    ]
    @Published var favoritesOnly = false
    
    func addNote(title: String, text: String) {
        notes.append(Note(title: title, text: text))
    }
    
    func toggleFavorite(note: Note) {
        if let index = notes.firstIndex(where: {$0.id == note.id}) {
            notes[index].isFavorite.toggle()
        }
    }
    
    func filteredNotes() -> [Note] {
        if favoritesOnly {
            return notes.filter({$0.isFavorite})
        } else {
            return notes
        }
    }
}
