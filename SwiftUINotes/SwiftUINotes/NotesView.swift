//
//  NotesView.swift
//  SwiftUINotes
//
//  Created by Эльвира Самигуллина on 29.04.2023.
//

import SwiftUI

private var notes = [
    Note(title: "Hello", content: "World"),
    Note(title: "Second", content: "kmvelk"),
]
private var favoriteNotes = [
    Note(title: "Text", content: "One"),
]

struct NotesView: View {
    @State private var singleSelection: UUID?
    
    @Binding var isCompact: Bool
    
    var body: some View {
        NavigationStack {
            List(selection: $singleSelection) {
                Section {
                    ForEach(favoriteNotes) { note in
                        NavigationLink {
                            NoteView(title: note.title, content: note.content)
                         } label: {
                             if isCompact {
                                 Text(note.title)
                             } else {
                                 VStack(alignment: .leading) {
                                     Text(note.title).font(.title3).bold()
                                     Text(note.content)
                                 }
                             }
                         }
                    }
                } header: {
                    Text("Favorites")
                }
                Section {
                    ForEach(notes) { note in
                        NavigationLink {
                            NoteView(title: note.title, content: note.content)
                         } label: {
                             if isCompact {
                                 Text(note.title)
                             } else {
                                 VStack(alignment: .leading) {
                                     Text(note.title).font(.title3).bold()
                                     Text(note.content)
                                 }
                             }
                         }
                    }
                } header: {
                    Text("All Notes")
                }
            }
            .listStyle(.insetGrouped)
        }
    }
}

//struct NotesView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotesView(isCompact: $isCompact)
//    }
//}

