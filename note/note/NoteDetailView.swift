//
//  NoteDetailView.swift
//  note
//
//  Created by Элина Абдрахманова on 29.04.2023.
//

import SwiftUI

struct NoteDetailView: View {
    let note: Note
    
    var body: some View {
        VStack {
            
            List {
                Section(header: Text("")) {
                    Text(note.title)
                        .font(.largeTitle)
                    Text(note.text)
                }
            }
        }
    }
}
