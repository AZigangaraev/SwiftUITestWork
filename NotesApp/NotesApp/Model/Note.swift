//
//  Note.swift
//  NotesApp
//
//  Created by Илья Казначеев on 29.04.2023.
//

import Foundation


struct Note: Identifiable, Hashable {
    let id: String = UUID().uuidString
    var title: String
    var value: String
    var favorite: Bool
}
