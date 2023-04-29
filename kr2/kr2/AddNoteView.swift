import SwiftUI


struct AddNoteView: View {
    @EnvironmentObject var data: NoteData
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var description = ""
    
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
            .navigationTitle("Новая заметка")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Text("Отмена")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        let newNote = Note(title: title, description: description)
                        self.data.notes.append(newNote)
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
