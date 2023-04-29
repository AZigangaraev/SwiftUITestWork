//
//  NotesEditorView.swift
//  note
//
//  Created by Элина Абдрахманова on 29.04.2023.
//

import SwiftUI

struct NotesEditorView: View {
    
    @Binding
    var isActive: Bool
    
    @EnvironmentObject
    var navigationObject: NavigationObject
    
    @State
    private var title = ""
    
    @State
    private var text = ""
    
    var onSave: (String, String) -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            HStack() {
                Button(action: {
                    isActive.toggle()
                }) {
                    Text("Cancel")
                }
                
                Button(action: {
                    onSave(title, text)
                    isActive.toggle()
                }) {
                    Text("Save")
                }
                .controlSize(.large)

                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 20)
            }
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.title2.weight(.regular))
                .frame(width: 280, height: 40)
            
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.title2.weight(.regular))
                .frame(width: 280, height: 40)
        }
    }
}
