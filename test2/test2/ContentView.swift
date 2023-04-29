//
//  ContentView.swift
//  test2
//
//  Created by macbook Denis on 4/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var defaultCell = false
    @State private var showCreateView = false
    @State private var showNoteView = false


    @State private var notes: [Note] = [
        Note(title: "adfasdas", description: "sadasdasdas"),
        Note(title: "don yagon", description: "chil yadro")
    ]
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(notes.indices, id: \.self) { index in
                        var note = notes[index]
                        NavigationLink(destination: NoteView(note: note, showNoteView: $showNoteView, notes: $notes)) {
                            if defaultCell {
                                HStack{
                                    Text(note.title)
                                    Spacer()
                                    Button(action: {
                                        note.isLike.toggle()
                                    }, label: {
                                        Image(systemName: note.isLike ? "star.fill" : "star")
                                            .foregroundColor(.yellow)
                                    })
                                    .buttonStyle(BorderlessButtonStyle())
                                    .frame(width: 30, height: 30)
                                }
                            } else {
                                HStack{
                                    VStack(alignment: .leading) {
                                        Text(note.title)
                                            .font(.headline)
                                        Text(note.description)
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                    Button(action: {
                                        note.isLike.toggle()
                                    }, label: {
                                        Image(systemName: note.isLike ? "star.fill" : "star")
                                            .foregroundColor(.yellow)
                                    })
                                    .buttonStyle(BorderlessButtonStyle())
                                    .frame(width: 30, height: 30)
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("Notes")
                                .navigationBarItems(trailing:
                                    Button(action: {
                                        showCreateView = true 
                                    }) {
                                        Image(systemName: "plus")
                                    }
                                )
                                .sheet(isPresented: $showCreateView, content: {
                                    CreateView(notes: $notes, showCreateView: $showCreateView)
                                    
                                })
            }
            .tabItem {
                Image(systemName: "note")
                Text("Notes")
            }
            SettingsView(defaultCell: $defaultCell)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
