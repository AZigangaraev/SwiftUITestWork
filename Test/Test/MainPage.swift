//
//  ContentView.swift
//  Test
//
//  Created by Daniil Chemaev on 29.04.2023.
//

import SwiftUI

class NavigationObject: ObservableObject {
    @Published
    var path: NavigationPath = .init()
}

struct MainPage: View {
    @EnvironmentObject var notesList: NotesList

    @State var createNote: Bool = false
    @State var showNotePage: Bool = false

    @ObservedObject
    var navigationObject: NavigationObject = .init()

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Favourites")) {
                    ForEach(notesList.favoriteNotes) { note in
                        HStack {
                            Text(note.title)
                            Spacer()
                            Button {

                            } label: {
                                Image(systemName: "star.fill")
                            }
                                .foregroundColor(.black)
                        }
                    }
                }

                Section(header: Text("All notes")) {
                    ForEach(notesList.notes) { note in
                        HStack {
                            Text(note.title)
                            Spacer()
                            Button {
                                print("Fav button")
                            } label: {
                                Image(systemName: "star")
                            }
                                .foregroundColor(.black)
                        }
                    }
                }
            }
                .toolbar {
                Button {
                    createNote.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }

                .navigationDestination(isPresented: $createNote) {
                NotePage()
            }
                .navigationDestination(isPresented: $showNotePage) {
                NotePage(title: "title", content: "content")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage().environmentObject(NotesList())
    }
}
