//
//  NoteAddView.swift
//  Test
//
//  Created by Максим Тарасов on 29.04.2023.
//

import SwiftUI

struct NoteAddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var label = ""
    @State private var text = ""
    @Binding var note: Note
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Label", text: $label)
                .frame(height: 60)
                .border(.black)
                .padding(.horizontal)
                Spacer()
                ZStack {
                    TextEditor(text: $text)
                    Text(text).opacity(0).padding(.horizontal)
                    
                }.shadow(radius: 1)
                    .padding(.horizontal)
            }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Close") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Save") {
                            dismiss()
                        }
                    }
                }
        }
    }
}

//struct NoteAddView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteAddView()
//    }
//}
