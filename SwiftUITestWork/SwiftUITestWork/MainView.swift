//
//  MainView.swift
//  SwiftUITestWork
//
//  Created by Alsu Faizova on 29.04.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var notes: NoteList
    
    @State var isCompactNote: Bool = false
    
    @State var showCreatorView: Bool = false
    
    @ObservedObject
    var navigationObject: NavigationObject = .init()

    var body: some View {

        NavigationStack() {
            List {
                Section("favorites") {
                    ForEach(notes.favoriteNotes) { note in
                        NavigationLink(value: note) {
                            if isCompactNote {
                                CompactNoteCell(note: note)
                            } else {
                                NormalNoteCell(note: note)
                            }
                        }
                    }
                    .frame(maxHeight: 60)
                }

                Section("all notes") {
                    ForEach(notes.notes) { note in
                        NavigationLink(value: note) {
                            if isCompactNote {
                                CompactNoteCell(note: note)
                            } else {
                                NormalNoteCell(note: note)
                            }
                        }
                    }
                    .frame(maxHeight: 60)
                }
            }
                .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showCreatorView.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .navigationDestination(isPresented: $showCreatorView) {
                                NoteCreatorView(title: "", text: "")
                            }
                    }
                }
            }
                .navigationDestination(for: Note.self) { note in
                    NoteCreatorView(title: note.title, text: note.text ?? "")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(NoteList())
    }
}
