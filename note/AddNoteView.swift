import SwiftUI

struct AddNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var noteStore: NoteStore
    
    @State var title: String = ""
    @State var content: String = ""
    
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
            .navigationBarTitle("Add Note", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Отменить") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Сохранить") {
                    let note = Note(title: title, content: content)
                    noteStore.notes.append(note)
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        let note = Note(title: "Sample Note", content: "This is a sample note")
        EditNoteView(note: note)
    }
}
