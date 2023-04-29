//
//  NotesList.swift
//  NotesApp
//
//  Created by Лена Гусарова on 29.04.2023.
//

import SwiftUI


struct NotesListView: View {
    @ObservedObject var store: NoteStore

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(store.notes) { note in
                        NavigationLink(destination: NoteEditView(store: store, note: note))  {
                            NoteCell(note: note)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: NoteEditView(store: store)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}


