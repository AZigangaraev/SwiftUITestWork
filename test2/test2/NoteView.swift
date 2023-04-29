//
//  NoteView.swift
//  test2
//
//  Created by macbook Denis on 4/29/23.
//

import SwiftUI

struct NoteView: View {
    @State var note: Note
    @State private var title: String = ""
    @State private var description: String = ""
    @Binding var showNoteView: Bool
    @Binding var notes: [Note]

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $title)
                    .padding()
                    .cornerRadius(10)
                    .background(Color.white)
                    .border(Color.black, width: 2)
                    .padding(10)

                TextEditor(text: $description)
                    .padding(10)
                    .cornerRadius(10)
                    .border(Color.black, width: 2)
                    .padding(10)
            }
            .navigationBarItems(
                trailing:
                    Button("Save") {
                        note.title = title
                        note.description = description
                        showNoteView = false
                        presentationMode.wrappedValue.dismiss()
                    }
            )
            .onAppear {
                title = note.title
                description = note.description
            }
        }
    }
}
