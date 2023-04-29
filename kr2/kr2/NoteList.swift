//
//  NoteList.swift
//  kr2
//
//  Created by Rafael Shamsutdinov on 29.04.2023.
//

import SwiftUI

struct NoteList: View {
    @EnvironmentObject var noteStore: NoteStore
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Избранное")) {
                    ForEach(noteStore.getAllNotes().filter { $0.isFavourite }) { note in
                        NavigationLink(destination: NoteEditor(note: note)) {
                            NoteCell(note: note, onToggleFavourite: { noteStore.toggleFavourite(note: note) })
                        }
                    }
                }
                Section(header: Text("Все заметки")) {
                    ForEach(noteStore.getAllNotes()) { note in
                        if !note.isFavourite {
                            NavigationLink(destination: NoteEditor(note: note)) {
                                NoteCell(note: note,onToggleFavourite: { noteStore.toggleFavourite(note: note) })
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Заметки")
            .navigationBarItems(trailing:
                NavigationLink(destination: NoteEditor(note: Note(title: "", bodyText: "", isFavourite: false))) {
                    Image(systemName: "plus")
                }
            )
            
        }
    }
}

