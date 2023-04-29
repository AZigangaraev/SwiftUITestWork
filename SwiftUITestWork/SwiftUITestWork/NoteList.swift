//
//  Data.swift
//  SwiftUITestWork
//
//  Created by Alsu Faizova on 29.04.2023.
//

import Foundation

class NoteList: ObservableObject {
    
    @Published var notes: [Note] = [
        .init(title: "Hello, world!", text: "Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world!"),
        .init(title: "Hello, world!")
    ]

    @Published var favoriteNotes: [Note] = [
        .init(title: "Hello, world!")
    ]
}
