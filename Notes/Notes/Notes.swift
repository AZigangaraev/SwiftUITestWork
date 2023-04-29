

import Foundation

struct Note: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    var isFavorite: Bool = false
}
