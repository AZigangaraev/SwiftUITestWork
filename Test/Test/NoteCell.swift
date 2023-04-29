//
//  NoteCell.swift
//  Test
//
//  Created by Daniil Chemaev on 29.04.2023.
//

import SwiftUI

struct CompactNoteCell: View {
    let note: Note

    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
        }
    }
}

struct NormalNoteCell: View {
    let note: Note

    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
            Text(note.body)
                .font(.caption)
        }
    }
}

