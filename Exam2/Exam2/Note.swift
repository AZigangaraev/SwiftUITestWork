//
//  Note.swift
//  Exam2
//
//  Created by Полина Рыфтина on 29.04.2023.
//

import Foundation

struct Note: Identifiable, Hashable {
    var id = UUID()
    
    var title: String
    var text: String
}
