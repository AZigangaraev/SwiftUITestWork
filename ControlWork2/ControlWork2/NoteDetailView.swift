//
//  ТщеуВуефшдыМшуц.swift
//  ControlWork2
//
//  Created by Радмир Фазлыев on 29.04.2023.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note
    @Binding var notes: [Note]
    @State private var isEditing = false
    @State private var updatedTitle = ""
    @State private var updatedContent = ""
    
    var body: some View {
        VStack {
            if isEditing {
                TextField("Заголовок", text: $updatedTitle)
                    .font(.title)
                    .padding(.horizontal)
                
                Divider()
                
                TextEditor(text: $updatedContent)
                    .padding(.horizontal)
                    .frame(minHeight: 200)
                
                Divider()
                
                Button(action: {
                    if let index = notes.firstIndex(where: { $0.id == note.id }) {
                        notes[index].title = updatedTitle
                        notes[index].content = updatedContent
                    }
                    isEditing = false
                }) {
                    Text("Готово")
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(5)
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(note.title)
                            .font(.title)
                        
                        Text(note.content)
                            .font(.body)
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle(note.title)
        .navigationBarItems(trailing: Button(action: {
            isEditing = true
            updatedTitle = note.title
            updatedContent = note.content
        }) {
            Image(systemName: "pencil")
        })
    }
}
