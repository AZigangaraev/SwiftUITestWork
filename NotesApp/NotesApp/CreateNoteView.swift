//
//  CreateNoteView.swift
//  NotesApp
//
//  Created by Илья Казначеев on 29.04.2023.
//

import SwiftUI

struct CreateNoteView: View {
    
    @EnvironmentObject var settings: NoteSettings
    @Binding var notes: [Note]
    @State var note: Note
    
    var body: some View {
        VStack {
            TextField("Title", text: $note.title)
                .padding()
                .border(.black)
                .padding()
            
            TextEditor(text: $note.value)
                .border(.black)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if let index = index(for: note) {
                        print(note)
                        notes[index] = note
                        print(notes)
                    } else {
                        notes.append(note)
                    }
                } label: {
                    Text("Save")
                }
            }
        }
    }
    
    func index(for note: Note) -> Int? {
        notes.firstIndex(where: { $0.id == note.id })
    }

}
