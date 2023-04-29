//
//  NoteEdit.swift
//  kr2
//
//  Created by Rafael Shamsutdinov on 29.04.2023.
//

import SwiftUI


struct NoteEditor: View {
    @EnvironmentObject var noteStore: NoteStore
    @Environment(\.presentationMode) var presentationMode
    @State var note: Note
    
    var body: some View {
        VStack {
            TextField("Заголовок", text: $note.title)
                .font(.headline)

            Divider()
            TextEditor(text: $note.bodyText)
                .font(.subheadline)
        }
        .padding(.top, 16)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .navigationBarTitle(Text("Редактирование"))
        .navigationBarItems(trailing: Button("Save") {
            noteStore.save(note)
            self.presentationMode.wrappedValue.dismiss()
        })
    }
}
