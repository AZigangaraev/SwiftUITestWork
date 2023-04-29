//
//  CreateView.swift
//  test2
//
//  Created by macbook Denis on 4/29/23.
//

import SwiftUI

struct CreateView: View {
    @Binding var notes: [Note]
    @Binding var showCreateView : Bool
    @State private var title: String = ""
    @State private var description: String = ""

    var body: some View {
            NavigationView {
                VStack {
                    TextField("Title", text: $title)
                        .padding()
                        .cornerRadius(10)
                        .background(Color.white)
                        .border(Color.black, width: 2)
                        .padding(10)

                    TextEditor(text: $description)
                        .padding(10)
                        .cornerRadius(10)
                        .border(Color.black, width: 2)
                        .padding(10)
                }
                .navigationBarItems(
                    leading:
                        Button("Cancel") {
                            showCreateView = false
                        },
                    trailing:
                        Button("Save") {
                            var note = Note(title: title, description: description)
                            notes.append(note)
                            showCreateView = false
                            
                        }
                )
            }
        }
}
