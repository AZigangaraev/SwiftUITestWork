//
//  MainView.swift
//  Test
//
//  Created by Максим Тарасов on 29.04.2023.
//

import SwiftUI

class NavigationObject: ObservableObject {
    @Published
    var path: NavigationPath = .init()
}

struct NoteCell: View {
    let item: Note

    var body: some View {
        HStack {
            Text(item.text)
            Spacer()
            Button(action: {
                print("star")
            }) {
                if item.favorite == true{
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct NoteBigCell: View {
    let item: Note

    var body: some View {
        HStack {
            Text(item.title)
            Text(item.text)
            Spacer()
            Button(action: {
                print("star")
            }) {
                if item.favorite == true{
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct MainView: View {
    @State private var isAddViewShow = false
    @Binding var toggleIsOn: Bool
    var notesItems: [Note] = [
        Note(title: "1", text: "First", favorite: true),
            Note(title: "2", text: "Second", favorite: false),
            Note(title: "3", text: "Third", favorite: true),
            Note(title: "4", text: "Fourth", favorite: false),
            Note(title: "5", text: "Fifth", favorite: true),
        ]
    
    @ObservedObject var navigationObject: NavigationObject = .init()
    
    var body: some View {
        NavigationStack(path: $navigationObject.path) {
            List {
                if toggleIsOn == true {
                    Section(header: Text("FAVORITES")) {
                        ForEach(notesItems.filter({ $0.favorite })) { item in
                            NavigationLink(value: item) {
                                NoteCell(item: item)
                            }
                        }
                    }
                    Section(header: Text("ALL NOTES")) {
                        ForEach(notesItems) { item in
                            NavigationLink(value: item) {
                                NoteCell(item: item)
                            }
                        }
                    }
                } else {
                    Section(header: Text("FAVORITES")) {
                        ForEach(notesItems.filter({ $0.favorite })) { item in
                            NavigationLink(value: item) {
                                NoteBigCell(item: item)
                            }
                        }
                    }
                    Section(header: Text("ALL NOTES")) {
                        ForEach(notesItems) { item in
                            NavigationLink(value: item) {
                                NoteBigCell(item: item)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Note.self) { note in NoteView(note: note)
            }
            .toolbar {
                Button(action: {
                    isAddViewShow.toggle()
                }) {
                    Image(systemName: "plus.circle")
                }
            }
            .sheet(isPresented: $isAddViewShow) {
                NoteAddView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let binding = Binding<Bool>(get: { false }, set: { _ in })
            return
        MainView(toggleIsOn: binding)
    }
}
