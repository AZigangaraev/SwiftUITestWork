//
//  NoteView.swift
//  Test
//
//  Created by Максим Тарасов on 29.04.2023.
//

import SwiftUI

struct NoteView: View {
    @State private var title: String
    @State private var text: String
    
    var note: Note
    
    init(note: Note) {
        self.note = note
        self._title = State(initialValue: note.title)
        self._text = State(initialValue: note.text)
    }
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
            .frame(height: 60)
            .border(.black)
            .padding(.horizontal)
            Spacer()
            ZStack {
                TextEditor(text: $text)
                Text(note.text).opacity(0).padding(.horizontal)
                
            }.shadow(radius: 1)
                .padding(.horizontal)
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(note: Note(title: "1", text: "First", favorite: true))
    }
}
