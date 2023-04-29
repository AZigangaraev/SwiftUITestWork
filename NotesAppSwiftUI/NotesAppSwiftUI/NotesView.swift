//
//  NotesView.swift
//  NotesAppSwiftUI
//
//  Created by Nikita Marin on 29.04.2023.
//

import SwiftUI

struct NotesView: View {
    @Binding var compactCells: Bool
    @State var favoriteNotes: Set<UUID> = []
    @State private var isPresentingAddNoteView = false 
    @State var notes: [Note] = [
        Note(id: UUID(), title: "note 1", isFavourite: true, description: "desc for note 1"),
        Note(id: UUID(), title: "note 2", isFavourite: true, description: nil),
        Note(id: UUID(), title: "note 3", isFavourite: false, description: nil),
        Note(id: UUID(), title: "note 4", isFavourite: true, description: "desc for note 2"),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(notes) { note in
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            if compactCells {
                                Text(note.title)
                            } else {
                                Text(note.title).font(.title)
                                note.description != nil ? Text(note.description!) : nil
                            }
                        }
                        Spacer()
                        Button(action: {
                            print("add to fav")
                        }) {
                            VStack {
                                Image(systemName: favoriteNotes.contains(note.id) ? "star.fill" : "star")
                                    .foregroundColor(favoriteNotes.contains(note.id) ? .black : .gray)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                }
            }
            .toolbar {
                Button {
                    isPresentingAddNoteView = true
                } label: {
                    Image(systemName: "plus")
                }
            }.sheet(
                isPresented: $isPresentingAddNoteView, content: {
                    AddNoteView(isPresented: self.$isPresentingAddNoteView, notes: $notes)
            })
        }
    }
}

