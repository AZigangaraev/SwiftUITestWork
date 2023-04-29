//
//  NotePage.swift
//  Test
//
//  Created by Daniil Chemaev on 29.04.2023.
//

import SwiftUI

struct NotePage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var title: String = ""
    @State var content: String = ""

    @ObservedObject
    var navigationObject: NavigationObject = .init()

    @EnvironmentObject var notes: NotesList

    var body: some View {
        NavigationStack(path: $navigationObject.path) {

            VStack(alignment: .leading, spacing: 15) {
                TextField("Title", text: $title)
                    .padding(10)
                    .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 2)
                }
                TextEditor(text: $content)
                    .padding(10)
                    .multilineTextAlignment(.leading)
                    .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 2)
                }
            }
                .padding(10)
                .frame(
                maxWidth: .infinity,
                maxHeight: .infinity)

                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            notes.notes.append(Note(title: title, body: content))
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Save")
                        }
                    }
                }
        }
    }
}

struct NotePage_Previews: PreviewProvider {
    static var previews: some View {
        NotePage()
    }

}
