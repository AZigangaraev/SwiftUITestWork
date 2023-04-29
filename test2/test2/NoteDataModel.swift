//
//  NoteDataModel.swift
//  test2
//
//  Created by macbook Denis on 4/29/23.
//

import Foundation


struct Note: Hashable, Codable {
    var id: UUID
    var title: String
    var description: String
    var isLike: Bool
    var isSelected: Bool = false 
    
    init(id: UUID = UUID(), title: String, description: String, isLike: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.isLike = isLike
    }
}
