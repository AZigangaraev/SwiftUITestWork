import SwiftUI

struct NoteView: View {
    @EnvironmentObject var data: NoteData
    @State private var showEditNoteView = false
    var note: Note
    
    var body: some View {
        HStack {
            Text(note.title)
            if !data.compactCells {
                Text(note.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
            Button(action: { self.data.notes[self.data.notes.firstIndex(where: { $0.id == note.id })!].isFavorite.toggle() }) {
                Image(systemName: note.isFavorite ? "star.fill" : "star")
                    .foregroundColor(note.isFavorite ? .black : .gray)
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding(.trailing, 8)
            Button(action: { self.showEditNoteView = true }) {
                Image(systemName: "pencil")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(8)
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .sheet(isPresented: $showEditNoteView) {
            EditNoteView(note: note)
                .environmentObject(data)
        }
    }
}
