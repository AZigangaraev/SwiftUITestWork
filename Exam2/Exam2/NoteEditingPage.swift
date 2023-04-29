//
//  NoteEditingPage.swift
//  Exam2
//
//  Created by Полина Рыфтина on 29.04.2023.
//

import SwiftUI

struct customViewModifier: ViewModifier {
    var roundedCornes: CGFloat
    var color: Color
    var textColor: Color

    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .cornerRadius(roundedCornes)
            .padding(3)
            .foregroundColor(textColor)
            .font(.custom("Open Sans", size: 18))
            .shadow(radius: 1)
    }
}

struct NoteEditingPage: View {
    @ObservedObject
    var notesData: Notesdata
    
    @State var note: Note
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Title", text: $note.title)
                .modifier(customViewModifier(
                    roundedCornes: 5,
                    color: .white,
                    textColor: .black))
                
            
            TextField("Body", text: $note.text)
                .frame(height: 500)
                .modifier(customViewModifier(
                    roundedCornes: 5,
                    color: .white,
                    textColor: .black))
        }
        .padding(15)
        .toolbar {
            Button(action: {
                notesData.allNotes.append(note)
                print("save pressed")

            }) {
                Text("Save")
            }
            
        }
    }
}

//struct NoteEditingPagee_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteEditingPage(note: $Note(title: "dd", text: "ddd"))
//    }
//}

