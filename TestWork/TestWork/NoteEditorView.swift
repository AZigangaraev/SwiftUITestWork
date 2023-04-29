//
//  NoteEditorView.swift
//  TestWork
//
//  Created by Artyom Tabachenko on 29.04.2023.
//

import SwiftUI

struct NoteEditorView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State
    var noteTitle: String = ""
    @State
    var noteBody: String = ""
    
    
    @ObservedObject var viewModel = NotesViewModel()
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                HStack() {
                    Button("Back") {
                        dismiss()
                    }
                    Spacer()
                    Button("Save") {
                        if !noteTitle.isEmpty && !noteBody.isEmpty {
                            viewModel.addNote(title: noteTitle, text: noteBody)
                        }
                    }
                    .disabled(noteTitle.isEmpty || noteTitle.isEmpty)
                }
                .padding(.horizontal, 20)
                TextField("Title", text: $noteTitle)
                    .frame(height: 60)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color.black, lineWidth: 1)
                            .background(Color.white).cornerRadius(20)
                    )
                    .padding(.horizontal, 20)
                TextEditor(text: $noteBody)
                    .frame(height: 550)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color.black, lineWidth: 1)
                            .background(Color.white).cornerRadius(20)
                    )
                    .padding(.horizontal, 20)
            }
        }
    }
}

struct NoteEditorView_Previews: PreviewProvider {
    static var previews: some View {
        NoteEditorView()
    }
}
