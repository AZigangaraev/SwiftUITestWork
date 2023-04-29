import SwiftUI

struct Note: Identifiable, Equatable {
    let id: UUID
    var title: String
    var content: String
    var isFavorite: Bool

    init(title: String, content: String, isFavorite: Bool = false) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.isFavorite = isFavorite
    }
}

class NoteStore: ObservableObject {
    @Published var notes = [
            Note(title: "First note", content: "This is my first note."),
            Note(title: "Second note", content: "This is my second note."),
            Note(title: "Third note", content: "This is my third note.")
        ]
    
    func add(note: Note) {
        notes.append(note)
    }
    
    func delete(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    
    func delete(note: Note) {
        if let index = notes.firstIndex(of: note) {
            notes.remove(at: index)
        }
    }
    
    func update(id: UUID, title: String, content: String) {
        if let index = notes.firstIndex(where: { $0.id == id }) {
            notes[index].title = title
            notes[index].content = content
        }
    }
    
    func toggleFavorite(note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].isFavorite.toggle()
        }
    }
    
    func getFavorites() -> [Note] {
        return notes.filter { $0.isFavorite }
    }
}

struct ContentView: View {
    @EnvironmentObject var noteStore: NoteStore
    @State var isCompact = false
    
    @State private var showAddNote = false
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    Section(header: Text("Избранные")) {
                        ForEach(noteStore.getFavorites()) { note in
                            if isCompact {
                                CompactNoteRow(note: note)
                            } else {
                                NoteRow(note: note)
                            }
                        }
                        .onDelete(perform: noteStore.delete(at:))
                    }
                    Section(header: Text("Заметки")) {
                        ForEach(noteStore.notes) { note in
                            if isCompact {
                                CompactNoteRow(note: note)
                            } else {
                                NoteRow(note: note)
                            }
                        }
                        .onDelete(perform: noteStore.delete(at:))
                    }
                }
                .navigationTitle("Notes")
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            self.showAddNote = true
                        }) {
                            Image(systemName: "plus")
                        })
            }
            .sheet(isPresented: $showAddNote) {
                AddNoteView()
                    .environmentObject(noteStore)
            }
            .tabItem {
                Image(systemName: "note.text")
                Text("Заметки")
            }
            
            NavigationView {
                SettingsView(isCompact: $isCompact)
                    .navigationBarTitle("Настройки")
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Настройки")
            }
        }
        .environmentObject(noteStore)
    }
}

struct NoteRow: View {
    let note: Note
    @EnvironmentObject var noteStore: NoteStore
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                Text(note.content)
            }
            Spacer()
            Button(action: {
                noteStore.toggleFavorite(note: note)
            }) {
                Image(systemName: note.isFavorite ? "star.fill" : "star")
            }
        }
    }
}

struct CompactNoteRow: View {
    let note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.headline)
            Text(note.content)
                .lineLimit(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
