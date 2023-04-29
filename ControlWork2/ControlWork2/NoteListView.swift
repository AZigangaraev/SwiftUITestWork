//
//  NoteListView.swift
//  ControlWork2
//
//  Created by Радмир Фазлыев on 29.04.2023.
//

import SwiftUI

struct NoteListView: View {
    @State private var showingAddNoteView = false
    @State private var newNoteTitle = ""
    @State private var newNoteContent = ""
    @State private var notes = [Note]()

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Любимые")) {
                    ForEach(notes.filter({ $0.isFavorite })) { note in
                        NoteRow(note: note, notes: $notes)
                    }
                }
                Section(header: Text("Все заметки")) {
                    ForEach(notes.filter({ !$0.isFavorite })) { note in
                        NoteRow(note: note, notes: $notes)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Заметки")
            .navigationBarItems(trailing:NavigationLink(destination: AddNoteView(title: $newNoteTitle, content: $newNoteContent, notes: $notes)) {
                Image(systemName: "plus")
            })
        }
    }
}

struct NoteRow: View {
    var note: Note
    @Binding var notes: [Note]
    @AppStorage("isCompactModeEnabled") private var isCompactModeEnabled = false
    var body: some View {
        HStack {
            if isCompactModeEnabled {
                Text(note.title)
            } else {
                VStack(alignment: .leading) {
                    Text(note.title)
                    Text(note.content.prefix(20))
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            }
            Spacer()
            Button(action: {
                if let index = notes.firstIndex(where: { $0.id == note.id }) {
                    notes[index].isFavorite.toggle()
                }
            }) {
                Image(systemName: note.isFavorite ? "star.fill" : "star")
                    .foregroundColor(note.isFavorite ? .black : .gray)
            }
        }
    }
}
