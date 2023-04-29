import SwiftUI



struct Note: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var isFavorite: Bool = false
}

class NoteData: ObservableObject {
    @Published var notes: [Note] = []
    @AppStorage("compactCells") var compactCells: Bool = false
}

struct NoteListView: View {
    @EnvironmentObject var data: NoteData
    @State private var showAddNoteView = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Избранное")) {
                    ForEach(data.notes.filter { $0.isFavorite }) { note in
                        NoteView(note: note)
                    }
                }
                Section(header: Text("Все заметки")) {
                    ForEach(data.notes) { note in
                        NoteView(note: note)
                    }
                }
            }
            .navigationTitle("Заметки")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { self.showAddNoteView = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showAddNoteView) {
            AddNoteView()
                .environmentObject(data)
        }
    }
}



                       






