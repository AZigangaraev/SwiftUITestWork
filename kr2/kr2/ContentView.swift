import SwiftUI


struct ContentView: View {
    @State private var selection = 0
    @StateObject private var noteData = NoteData()
    var body: some View {
        TabView(selection: $selection) {
            NoteListView()
                .environmentObject(noteData)
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Заметки")
                }
                .tag(0)
            SettingsView()
                .environmentObject(noteData)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Настройки")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
