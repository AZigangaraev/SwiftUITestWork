import SwiftUI

struct EditNoteView: View {
    @EnvironmentObject var data: NoteData
    @Environment(\.presentationMode) var presentationMode
    var note: Note
    @State private var title: String
    @State private var description: String
    init(note: Note) {
        self.note = note
        _title = State(initialValue: note.title)
        _description = State(initialValue: note.description)
    }
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Заголовок")) {
                    TextField("Введите заголовок", text: $title)
                }
                Section(header: Text("Описание")) {
                    TextEditor(text: $description)
                }
            }
            .navigationTitle("Редактировать заметку")
            .onAppear {
                title = note.title
                description = note.description
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Text("Отмена")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        let index = self.data.notes.firstIndex(where: { $0.id == note.id })!
                        self.data.notes[index].title = title
                        self.data.notes[index].description = description
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Сохранить")
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

