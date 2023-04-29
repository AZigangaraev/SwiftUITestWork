//
//  AddNoteView.swift
//  NotesAppSwiftUI
//
//  Created by Nikita Marin on 29.04.2023.
//

import SwiftUI


struct AddNoteView: View {
    @Binding var isPresented: Bool
    @Binding var notes: [Note]
    @State private var title = ""
    @State private var description = ""
    
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
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    if !title.isEmpty {
                        let note = Note(
                            id: UUID(),
                            title: title,
                            isFavourite: false,
                            description: description == "" ? nil : description
                        )
                        notes.append(note)
                        isPresented = false
                    }
                }
            )
        }
    }
}


