//
//  MainView.swift
//  NotesApp
//
//  Created by Илья Казначеев on 29.04.2023.
//

import SwiftUI

struct NoteCell: View {
    
    @State var note: Note
    @EnvironmentObject var settings: NoteSettings
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(note.title)
                
                if !settings.on {
                    Text(note.value)
                        .lineLimit(3)
                }
            }
            Spacer()
            Button {
                note.favorite.toggle()
            } label: {
                Image(systemName: note.favorite ? "star.fill" : "star")
                    .foregroundColor(.black)
            }
        }
        .environmentObject(settings)
    }
}


struct MainView: View {
    
    @EnvironmentObject var settings: NoteSettings
    
    @State var notes = [
        Note(title: "Title1", value: "asdjflkasjdhflkasjdfhlkasjdfhalskjdfhaslkjdfhaslkjdf", favorite: true),
        Note(title: "Title2", value: "sdfasdfasfdaf", favorite: true),
        Note(title: "Title3", value: "asdjflkasjdhflkasjdfhlkasjdfhalskjdfhaslkjdfhaslkjdf", favorite: false),
        Note(title: "Title4", value: "sdfasdfasfdaf", favorite: false),
    ]
    
    var favoriteNotes: [Note] {
        notes.filter { $0.favorite }
    }
    
    var allNotes: [Note] {
        notes.filter { !$0.favorite }
    }
    
    @State var path: NavigationPath = .init()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section() {
                    ForEach(favoriteNotes) { note in
                        NavigationLink(value: note) {
                            NoteCell(note: note)
                        }
                    }
                } header: {
                    Text("favorites")
                }
            
                Section {
                    ForEach(allNotes) { note in
                        NavigationLink(value: note) {
                            NoteCell(note: note)
                        }
                    }
                } header: {
                    Text("All notes")
                }
            }
            .navigationDestination(for: Note.self) { note in
                CreateNoteView(notes: $notes, note: note)
                    .environmentObject(settings)
            }
            
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        path.append(Note(title: "", value: "", favorite: false))
                    } label: {
                        Label("", systemImage: "plus")
                    }
                }
            }
        }
        .environmentObject(settings)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
