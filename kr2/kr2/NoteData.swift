//
//  data.swift
//  kr2
//
//  Created by Rafael Shamsutdinov on 29.04.2023.
//

import Foundation

struct Note: Identifiable, Encodable, Decodable{
    var id = UUID()
    var title: String
    var bodyText: String
    var isFavourite: Bool
}

class NoteStore: ObservableObject {
    static let shared = NoteStore()

    private let noteKey = "notes"

    @Published private var notes: [Note] {
        didSet {
            guard let data = try? JSONEncoder().encode(notes) else { return }
            UserDefaults.standard.set(data, forKey: noteKey)
        }
    }

    init() {
        if let data = UserDefaults.standard.data(forKey: noteKey),
            let notes = try? JSONDecoder().decode([Note].self, from: data) {
            self.notes = notes
        } else {
            self.notes = []
        }
    }

    func save(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note
        } else {
            notes.append(note)
        }
    }

    func delete(_ note: Note) {
        notes.removeAll(where: { $0.id == note.id })
    }

    func getAllNotes() -> [Note] {
        let favouriteNotes = notes.filter { $0.isFavourite }
        let otherNotes = notes.filter { !$0.isFavourite }
        return favouriteNotes + otherNotes
    }

    func toggleFavourite(note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].isFavourite.toggle()
        }
    }
}
