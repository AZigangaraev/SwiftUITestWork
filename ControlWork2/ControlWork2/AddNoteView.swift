//
//  AddNoteView.swift
//  ControlWork2
//
//  Created by Радмир Фазлыев on 29.04.2023.
//

import SwiftUI

struct AddNoteView: View {
    @Binding var title: String
    @Binding var content: String
    @Binding var notes: [Note]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .padding()

            Divider()

            TextEditor(text: $content)
                .padding()

            Spacer()
        }
        .navigationBarTitle("New note")
        .navigationBarItems(trailing: Button("Save") {
            notes.append(Note(title: title, content: content, isFavorite: false))
            self.presentationMode.wrappedValue.dismiss()
        }.disabled(title.isEmpty || content.isEmpty))
        .onDisappear {
            title = ""
            content = ""
        }
    }
}
