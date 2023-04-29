//
//  DataService.swift
//  Test
//
//  Created by Daniil Chemaev on 29.04.2023.
//

import Foundation

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var body: String
    var favourite: Bool = false

    init(title: String, body: String) {
        self.title = title
        self.body = body
    }

    init(title: String, body: String, favourite: Bool) {
        self.title = title
        self.body = body
        self.favourite = favourite
    }
}

class NotesList: ObservableObject {

    @Published var notes: [Note] = [
        Note(title: "title2", body: "bodybodybodybodybodybodybodybodybodybodybodybodybody"),
        Note(title: "title3", body: "bodybodybodybodybodybodybodybodybodybodybodybodybody"),
        Note(title: "title4", body: "bodybodybodybodybodybodybodybodybodybodybodybodybody"),
        Note(title: "title5", body: "bodybodybodybodybodybodybodybodybodybodybodybodybody"),
        Note(title: "title6", body: "bodybodybodybodybodybodybodybodybodybodybodybodybody"),
        Note(title: "title7", body: "bodybodybodybodybodybodybodybodybodybodybodybodybody"),
        Note(title: "title8", body: "bodybodybodybodybodybodybodybodybodybodybodybodybody"),
        Note(title: "title9", body: "bodybodybodybodybodybodybodybodybodybodybodybodybody"),
        Note(title: "title10", body: "bodybodybodybodybodybodybodybodybodybodybodybodybody"),
        Note(title: "title11", body: "bodybodybodybodybodybodybodybodybodybodybodybodybody"),
    ]

    @Published var favoriteNotes: [Note] = [
        Note(title: "title1", body: "bodybodybodybodybodybodybodybodybodybodybodybodybody", favourite: true),
    ]
}
