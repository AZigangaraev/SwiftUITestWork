//
//  NoteRow.swift
//  Exam2
//
//  Created by Полина Рыфтина on 29.04.2023.
//

import SwiftUI

struct NoteRow: View {
    @State var isFav: Bool = false
    
    var note: Note
    
    var body: some View {
        HStack(spacing: 50) {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(note.title)")
                    .font(.headline)
                    .frame(width: 150)
                    .padding(5)
                Text("\(note.text)")
                    .font(.subheadline)
                    .frame(width: 150)
                    .padding(5)
                    .lineLimit(2)
            }
            Button(action: {
                isFav.toggle()
                print(isFav)
            }) {
                Image(systemName: "star")
            }
        }
        .padding(10)
    }
}

struct NoteRowCompact: View {
    var note: Note
    
    var body: some View {
        HStack(spacing: 50) {
            Text("\(note.title)")
                .font(.headline)
                .frame(width: 150)
                .padding(5)
                .lineLimit(2)
            Button(action: {
              print("star pressed")

            }) {
                Image(systemName: "star")
            }
        }
        .padding(10)
    }
}
