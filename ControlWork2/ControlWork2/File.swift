//
//  File.swift
//  ControlWork2
//
//  Created by Радмир Фазлыев on 29.04.2023.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note
    
    var body: some View {
        VStack {
            Text(note.title)
                .font(.title)
                .padding()
            Text(note.content)
                .padding()
            Spacer()
        }
        .navigationBarTitle(note.title)
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let note = Note(title: "Заголовок заметки", content: "Текст заметки", isFavorite: false)
        NoteDetailView(note: note)
    }
}
