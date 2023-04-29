//
//  ContentView.swift
//  NotesApp
//
//  Created by Лена Гусарова on 29.04.2023.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var store = NoteStore()
    @State private var cellSize: CGFloat = 80
    
    var body: some View {
        TabView {
            NotesListView(store: store)
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Notes")
                }
            
            SettingsView(cellSize: $cellSize)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .environment(\.cellSize, cellSize)
    }
}

private struct CellSizeKey: EnvironmentKey {
    static let defaultValue: CGFloat = 80
}

private extension EnvironmentValues {
    var cellSize: CGFloat {
        get { self[CellSizeKey.self] }
        set { self[CellSizeKey.self] = newValue }
    }
}


struct NoteCell: View {
    var note: Note

    @Environment(\.cellSize) private var cellSize

    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.headline)
            Text(note.content)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(width: cellSize*1.5, height: cellSize)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
    }
}
