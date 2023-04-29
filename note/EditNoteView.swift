import SwiftUI

struct EditNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var noteStore: NoteStore
    
    var note: Note?
    @State var id: UUID
    @State var title: String
    @State var content: String
    
    init(note: Note?) {
        self.note = note
        _id = State(initialValue: note?.id ?? UUID())
        _title = State(initialValue: note?.title ?? "")
        _content = State(initialValue: note?.content ?? "")
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: $title)
                }
                Section(header: Text("Content")) {
                    TextEditor(text: $content)
                }
            }
            .navigationBarTitle("Edit Note", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Отменить") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Сохранить") {
                        noteStore.update(id: id, title: title, content: content)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}


struct EditNoteView_Previews: PreviewProvider {
    static var previews: some View {
        let note = Note(title: "Sample Note", content: "This is a sample note")
        EditNoteView(note: note)
    }
}
