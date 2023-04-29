//
//  NoteEdit.swift
//  NotesApp
//
//  Created by Лена Гусарова on 29.04.2023.
//

import SwiftUI

struct NoteEditView: View {
    @ObservedObject var store: NoteStore
    @Environment(\.presentationMode) var presentationMode
    
    var note: Note?
    
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Title", text: $title)
            }
            Section(header: Text("Content")) {
                TextEditor(text: $content)
            }
        }
        .onAppear {
            if let note = note {
                title = note.title
                content = note.content
            }
        }
        .navigationTitle(note == nil ? "New Note" : "Edit Note")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: saveNote) {
                    Text("Save")
                }
            }
        }
    }
    
    func saveNote() {
        let newNote = Note(title: title, content: content, creationDate: Date())
        if let note = note {
            store.notes[store.notes.firstIndex(of: note)!] = newNote
        } else {
            store.notes.append(newNote)
        }
        presentationMode.wrappedValue.dismiss()
    }
}

