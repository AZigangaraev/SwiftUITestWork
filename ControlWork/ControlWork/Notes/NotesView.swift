//
//  NotesView.swift
//  ControlWork
//
//  Created by Карина Хайрулина on 29.04.2023.
//

import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var favorite: Bool
}

struct NotesView: View {
    @Binding var showTabBar: Bool
    @State private var showEditNoteView = false
    @Binding var notes: [Note]
    @State private var compactCells = false
    @EnvironmentObject var settings: Settings
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Favorites")) {
                    ForEach(notes.filter { $0.favorite }) { note in
                        NoteCell(note: note, notes: $notes)
                            .environmentObject(settings)
                    }
                }
                
                Section(header: Text("All Notes")) {
                    ForEach(notes.filter { !$0.favorite }) { note in
                        NoteCell(note: note,notes: $notes)
                            .environmentObject(settings)
                    }
                    .environmentObject(settings)
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            
            
            .navigationBarItems(trailing: Button(action: {
                showEditNoteView = true
            }) {
                Image(systemName: "plus")
            })
            .fullScreenCover(isPresented: $showEditNoteView) {
                EditNoteView(notes: $notes)
                    .environmentObject(settings)
            }
            
        }
    }
}
