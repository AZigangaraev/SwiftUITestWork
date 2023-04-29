//
//  Note.swift
//  Test
//
//  Created by Максим Тарасов on 29.04.2023.
//

import Foundation


struct Note: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var text: String
    var favorite: Bool
}
