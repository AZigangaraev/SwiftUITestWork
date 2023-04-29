//
//  EditNoteView.swift
//  ControlWork
//
//  Created by Карина Хайрулина on 29.04.2023.
//

import SwiftUI

import SwiftUI

struct EditNoteView: View {
    
    @Binding var notes: [Note]
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                    .padding()
                
                
                TextEditor(text: $content)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                    .padding()
                
            }
            .navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                },
                trailing: Button(action: {
                    let newNote = Note(title: title, content: content,favorite: false)
                    notes.append(newNote)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                })
        }
    }
}


struct EditNoteView_Previews: PreviewProvider {
    static var previews: some View {
        EditNoteView(notes: .constant([]))
    }
}




