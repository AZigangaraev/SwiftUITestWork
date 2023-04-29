import SwiftUI


struct SettingsView: View {
    @EnvironmentObject var data: NoteData
    var body: some View {
        Form {
            Section(header: Text("Размер ячеек")) {
                Toggle(isOn: $data.compactCells) {
                    Text("Компактный вид ячеек")
                }
            }
        }
        .navigationTitle("Настройки")
    }
}
