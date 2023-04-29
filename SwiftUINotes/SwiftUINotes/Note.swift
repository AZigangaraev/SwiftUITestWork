//
//  Note.swift
//  SwiftUINotes
//
//  Created by Эльвира Самигуллина on 29.04.2023.
//

import Foundation

struct Note: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let content: String
}
