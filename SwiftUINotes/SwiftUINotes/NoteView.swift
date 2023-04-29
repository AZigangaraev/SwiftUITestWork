//
//  NoteView.swift
//  SwiftUINotes
//
//  Created by Эльвира Самигуллина on 29.04.2023.
//

import SwiftUI

struct NoteView: View {
    @State var title: String
    @State var content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
            TextField("", text: $content)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
            Spacer()
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
    }
}
     


