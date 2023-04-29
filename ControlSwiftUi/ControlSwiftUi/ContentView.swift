//
//  ContentView.swift
//  ControlSwiftUi
//
//  Created by Лада on 29.04.2023.
//

import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var isFavorite: Bool
}

struct ContentView: View {
    @EnvironmentObject var noteStore: NoteStore
    @State private var selectedNote: Note?
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("FAVORITES")) {
                    ForEach(noteStore.notes.filter({ $0.isFavorite })) { note in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(note.title)
                                    .font(.headline)
                                Text(note.description)
                                    .font(.subheadline)
                            }
//                            Button(action: {
//                                note.isFavorite = true
//                                selectedNote = note
//                            }, label: {
//                                Image(systemName: "star.fill")
//                            })
//                            .onTapGesture {
//                                selectedNote = note
//                            }
                        }
                    }
                }
                Section(header: Text("ALL NOTES")) {
                    ForEach(noteStore.notes) { note in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(note.title)
                                    .font(.headline)
                                Text(note.description)
                                    .font(.subheadline)
                            }
                        }
//                        Button(action: {
//                            note.isFavorite = false
//                            selectedNote = note
//                        }, label: {
//                            Image(systemName: "star")
//                        })
//                        .onTapGesture {
//                            selectedNote = note
//                        }
             
                    }
                }
            }
            .navigationBarItems(trailing:
                NavigationLink(destination: NewNoteView()) {
                    Image(systemName: "plus")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
