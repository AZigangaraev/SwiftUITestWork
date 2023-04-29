//
//  MainNotePage.swift
//  Exam2
//
//  Created by Полина Рыфтина on 29.04.2023.
//

import SwiftUI

struct MainNotePage: View {
    @ObservedObject
    var notesData: Notesdata
    
    @ObservedObject
    var noteSettings: NoteSetting
    
    @State
    var showNoteEditing: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Favorites") {
                    ForEach(notesData.favNotes, id: \.self) { note in
                        NavigationLink {
                            NoteEditingPage(
                                notesData: notesData,
                                note: note
                            )
                        } label: {
                            if noteSettings.showCompactCell {
                                NoteRowCompact(note: note)
                            } else {
                                NoteRow(note: note)
                            }
                           
                        }
                    }
                }
                Section("All notes") {
                    ForEach(notesData.allNotes, id: \.self) { note in
                        NavigationLink {
                            NoteEditingPage(
                                notesData: notesData,
                                note: note
                            )
                        } label: {
                            if noteSettings.showCompactCell {
                                NoteRowCompact(note: note)
                            } else {
                                NoteRow(note: note)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Notes").navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    let note = Note(title: "", text: "")
                    NoteEditingPage(notesData: notesData, note: note)
                } label: {
                    Image(systemName: "plus")
                }
            }
            
        }
    }
}

struct MainNotePage_Previews: PreviewProvider {
    static var previews: some View {
        MainNotePage(notesData: Notesdata(), noteSettings: NoteSetting())
    }
}
