//
//  NoteCell.swift
//  kr2
//
//  Created by Rafael Shamsutdinov on 29.04.2023.
//

import SwiftUI

struct NoteCell: View {
    var note: Note
    let onToggleFavourite: () -> Void
    @AppStorage("isCompact") var isCompact: Bool = false

    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                if !isCompact {
                    Text(note.bodyText)
                        .font(.subheadline)
                        .lineLimit(1)
                }
            }
            Spacer()
            Button(action: onToggleFavourite) {
                Image(systemName: note.isFavourite ? "star.fill" : "star")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.vertical, 8)
        .frame(height: isCompact ? 40 : 60) // устанавливаем высоту ячейки в зависимости от значения переключателя "isCompact"
    }
}

