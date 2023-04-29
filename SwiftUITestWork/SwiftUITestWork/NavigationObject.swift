//
//  NavigationObject.swift
//  SwiftUITestWork
//
//  Created by Alsu Faizova on 29.04.2023.
//

import SwiftUI

class NavigationObject: ObservableObject {
    @Published
    var path: NavigationPath = .init()
}
