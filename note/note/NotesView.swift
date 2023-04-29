//
//  NotesView.swift
//  note
//
//  Created by Элина Абдрахманова on 29.04.2023.
//

import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    var isFavorite = false
}

struct NotesView: View {
    
    @State
    private var selectedNote: Note? = nil
    
    @ObservedObject
    var navigationObject: NavigationObject = .init()
    
    @State
    private var isActive = false
    
    @State
    private var notes: [Note] = []
    
    
    
    func onSave(title: String, text: String) {
        let newNote = Note(title: title, text: text)
        notes.append(newNote)
    }
    
    func moveToFavorite(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].isFavorite.toggle()
            
            if notes[index].isFavorite == true {
                let favoriteNote = notes.remove(at: index)
                notes.insert(favoriteNote, at: 0)
            }
        }
    }
    
    
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                isActive.toggle()
            })
            {
                Image(systemName: "plus")
            }
            .controlSize(.large)
            .frame(height: 40)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .fullScreenCover(isPresented: $isActive) {
                NotesEditorView(isActive: $isActive, onSave: onSave)
                    .environmentObject(navigationObject)
            }
            
            List {
                Section(header: Text("FAVORITES")) {
                    ForEach(notes.filter { $0.isFavorite }) { note in
                        HStack {
                            Text(note.title)
                                .onTapGesture {
                                    selectedNote = note
                                }
                            Button(action: {
                                moveToFavorite(note)
                            }) {
                                if note.isFavorite {
                                    Image(systemName: "star.fill")
                                } else {
                                    Image(systemName: "star")
                                }
                            }
                            .foregroundColor(.yellow)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 8)
                        }
                    }
                }
                
                Section(header: Text("ALL NOTES")) {
                    ForEach(notes) { note in
                        HStack {
                            Text(note.title)
                                .onTapGesture {
                                    selectedNote = note
                                }
                            Button(action: {
                                moveToFavorite(note)
                            }) {
                                if note.isFavorite {
                                    Image(systemName: "star.fill")
                                } else {
                                    Image(systemName: "star")
                                }
                            }
                            .foregroundColor(.yellow)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 8)
                        }
                    }
                    .sheet(item: $selectedNote) { note in
                        NoteDetailView(note: note)
                    }
                }
            }
        }
    }
}

struct FavouriteRow: View {
    var body: some View {
        HStack() {
            
        }
    }
}

struct AllNotesRow: View {
    var body: some View {
        HStack() {
            
        }
    }
}

class NavigationObject: ObservableObject {
    @Published
    var path: NavigationPath = .init()
}


struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
