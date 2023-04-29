//
//  NewNoteView.swift
//  ControlSwiftUi
//
//  Created by Лада on 29.04.2023.
//

import SwiftUI

class NoteStore: ObservableObject {
    @Published var notes: [Note] = []
    
    func addNote(title: String, description: String) {
        let newNote = Note(title: title, description: description, isFavorite: false)
        notes.append(newNote)
    }
    
    func toggleFavorite(note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].isFavorite.toggle()
        }
    }
}

struct NewNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var noteStore: NoteStore
    @State private var noteTitle = ""
    @State private var noteDescription = ""
     
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Title", text: $noteTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
            TextField("", text: $noteDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
            Spacer()
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .navigationBarItems(trailing:
            Button(action: {
                self.noteStore.addNote(title: self.noteTitle, description: self.noteDescription)
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
                .font(.headline)
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .foregroundColor(.black)
                .cornerRadius(8)
            }
          )
    }
}
