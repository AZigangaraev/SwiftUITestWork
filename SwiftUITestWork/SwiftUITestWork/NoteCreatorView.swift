//
//  NoteCreatorView.swift
//  SwiftUITestWork
//
//  Created by Alsu Faizova on 29.04.2023.
//

import SwiftUI

struct NoteCreatorView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var title: String
    
    @State var text: String
    
    @EnvironmentObject var notes: NoteList
    
    @ObservedObject
    var navigationObject: NavigationObject = .init()
    
    var body: some View {
        NavigationStack() {
            VStack {
                TextField("Title", text: $title)
                    .autocorrectionDisabled()
                    .frame(height: 50)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 10))
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.black), lineWidth: 1.0)
                    )
                
                TextField("You need to tap here. I can't move it to the top:(", text: $text)
                    .autocorrectionDisabled()
                    .frame(height: 600)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 10))
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.black), lineWidth: 1.0)
                    )
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        notes.notes.append(Note(title: title, text: text))
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

struct NoteCreatorView_Previews: PreviewProvider {
    @Environment(\.dismiss) var dismiss
    static var previews: some View {
        NoteCreatorView(title: "", text: "")
    }
}
