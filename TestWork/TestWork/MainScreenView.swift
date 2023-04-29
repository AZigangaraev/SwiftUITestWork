//
//  MainScreenView.swift
//  TestWork
//
//  Created by Artyom Tabachenko on 29.04.2023.
//

import SwiftUI




struct noteCell: View {
    var note: Note
    @State
    var isFavorite: Bool = false
    var body: some View {
        HStack() {
            Text(note.noteTitle)
            Spacer()

        }
    }
    func addToFavorites() {
        isFavorite.toggle()
    }
}

struct MainScreenView: View {
    
    @State var addIsPressed: Bool = false
    
    var notes: [Note] = [
        .init(noteTitle: "Note1", noteBody: ""),
        .init(noteTitle: "Note2", noteBody: ""),
        .init(noteTitle: "Note3", noteBody: ""),
        .init(noteTitle: "Note4", noteBody: ""),
        .init(noteTitle: "Note5", noteBody: ""),
    ]
    
    @ObservedObject var viewModel = NotesViewModel()
       @State private var showAddNote = false
       @State private var newNoteTitle = ""
       @State private var newNoteBody = ""
       
       var body: some View {
           NavigationView {
               List(viewModel.filteredNotes()) { note in
                   HStack {
                       VStack(alignment: .leading) {
                           Text(note.noteTitle)
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
               .navigationBarTitle("Notes")
               .navigationBarItems(trailing:
                   Button(action: {
                       self.showAddNote = true
                   }) {
                       Image(systemName: "plus")
                   }
               )
               
               .sheet(isPresented: $showAddNote) {
                   VStack(alignment: .center, spacing: 20) {
                       HStack {
                           Button("Back") {
                               self.showAddNote = false
                           }
                           .padding(.horizontal, 20)
                           Spacer()
                           Button("Add Note") {
                               self.viewModel.addNote(title: self.newNoteTitle, text: self.newNoteBody)
                               self.showAddNote = false
                           }
                           .padding(.horizontal, 20)
                       }
                       TextField("Title", text: self.$newNoteTitle)
                           .frame(height: 60)
                           .foregroundColor(.black)
                           .font(.system(size: 20))
                           .padding(.horizontal, 10)
                           .background(
                               RoundedRectangle(cornerRadius: 20, style: .continuous)
                                   .stroke(Color.black, lineWidth: 1)
                                   .background(Color.white).cornerRadius(20)
                           )
                           .padding(.horizontal, 20)
                       TextEditor(text: self.$newNoteBody)
                           .frame(height: 550)
                           .foregroundColor(.black)
                           .font(.system(size: 20))
                           .padding(.horizontal, 10)
                           .background(
                               RoundedRectangle(cornerRadius: 20, style: .continuous)
                                   .stroke(Color.black, lineWidth: 1)
                                   .background(Color.white).cornerRadius(20)
                           )
                           .padding(.horizontal, 20)
                   }
               }
           }
       }

}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
