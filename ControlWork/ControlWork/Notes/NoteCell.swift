//
//  NoteCell.swift
//  ControlWork
//
//  Created by Карина Хайрулина on 29.04.2023.
//

import SwiftUI


struct NoteCell: View {
    let note: Note
    @Binding var notes: [Note]
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        HStack {
            Text(note.title)
            Spacer()
            Button(action: {
                if let index = notes.firstIndex(where: { $0.id == note.id }) {
                    notes[index].favorite.toggle()
                }
            }) {
                Image(systemName: note.favorite ? "star.fill" : "star")
                    .foregroundColor(note.favorite ? .black : .gray)
            }
        }
        .frame(height: settings.compactCells ? 44 : 80) // установка размера ячейки
    }
}


