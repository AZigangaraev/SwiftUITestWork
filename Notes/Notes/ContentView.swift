import SwiftUI

struct NotesView: View {
    @ObservedObject var viewModel = NotesViewModel()
    @State var isPresentingAddNote = false
    @State var newNoteTitle = ""
    @State var newNoteText = ""
    @State var isFavoritesTab = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.filteredNotes()) { note in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.text)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        if note.isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.toggleFavorite(note: note)
                    }
                }
            }
            .navigationBarTitle(Text("All notes"))
            .navigationBarItems(trailing: Button(action: {
                isPresentingAddNote = true
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $isPresentingAddNote, content: {
                NavigationView {
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Title", text: $newNoteTitle)
                            .font(.headline)
                            .frame(height: 50)
                            .background(Color.white)
                                        .cornerRadius(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color.gray, lineWidth: 2)
                                        )

                        Divider()
                        TextEditor(text: $newNoteText)
                            .font(.subheadline)
                            .background(Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                        
                        Divider()
            
                        HStack {
                            Spacer()
        
                            Button("Cancel") {
                                isPresentingAddNote = false
                                
                            }
                            Spacer()
                            Button("Save") {
                                if !newNoteTitle.isEmpty && !newNoteText.isEmpty {
                                    viewModel.addNote(title: newNoteTitle, text: newNoteText)
                                    isPresentingAddNote = false
                                }
                            }
                            .disabled(newNoteTitle.isEmpty || newNoteText.isEmpty)
                            Spacer()
                        }
                    }
                    .padding()
                    
                }
            })
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}

