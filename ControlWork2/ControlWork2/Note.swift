//
//  Note.swift
//  ControlWork2
//
//  Created by Радмир Фазлыев on 29.04.2023.
//

import Foundation

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var isFavorite: Bool
}
