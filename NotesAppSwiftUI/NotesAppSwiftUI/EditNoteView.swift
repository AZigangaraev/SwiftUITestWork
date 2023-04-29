//
//  EditNoteView.swift
//  NotesAppSwiftUI
//
//  Created by Nikita Marin on 29.04.2023.
//

import SwiftUI

struct EditNoteView: View {
    @Binding var note: Note
    @State var title: String = ""
    @State var description: String = ""
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $title)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextEditor(text: $description)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .cornerRadius(8)
                    .padding(.horizontal)
                Spacer()
            }
            .background(Color.white)
            .navigationBarItems(
                trailing: Button("Save") {
                    if !note.title.isEmpty {
                        note.title = title
                        note.description = description
                    }
                }
            )
        }
    }
}

