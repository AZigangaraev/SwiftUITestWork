//
//  NoteDetail.swift
//  NotesApp
//
//  Created by Лена Гусарова on 29.04.2023.
//

import SwiftUI

struct NoteDetailView: View {
    @ObservedObject var store: NoteStore
    var note: Note
    
    var body: some View {
        VStack {
            Text(note.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            Text(note.content)
                .padding()
            Spacer()
        }
        .navigationTitle(note.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: NoteEditView(store: store, note: note)) {
                    Text("Edit")
                }
            }
        }
    }
}
