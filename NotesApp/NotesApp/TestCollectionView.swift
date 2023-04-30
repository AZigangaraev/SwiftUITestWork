//
//  TestCollectionView.swift
//  NotesApp
//
//  Created by Илья Казначеев on 29.04.2023.
//

import SwiftUI

struct Item: Identifiable, Hashable {
    let id: String = UUID().uuidString
    var title: String
    var value: String
    var favorite: Bool
}

struct CreateItem: Identifiable, Hashable {
    let id: String = UUID().uuidString
    var title: String = ""
    var value: String = ""
    var favorite: Bool = false
}

struct ItemCell: View {
    
    @Binding var items: [Item]
    @Binding var item: Item
    @EnvironmentObject var settings: NoteSettings
    
    var body: some View {
        NavigationLink(value: item) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.title)
                        .font(Font.headline)
                    if !settings.on {
                        Text(item.value)
                            .lineLimit(3)
                    }
                }
                Spacer()
                Image(systemName: item.favorite ? "star.fill" : "star")
                    .onTapGesture {
                        if let index = items.firstIndex(where: { $0.id == item.id }) {
                            items[index].favorite.toggle()
                        }
                    }
            }
        }
    }
}

struct TestCollectionView: View {
    
    @EnvironmentObject var settings: NoteSettings
    @State var items = [
        Item(title: "Title 1", value: "Value 1", favorite: true),
        Item(title: "Title 2", value: "Value 2", favorite: false),
        Item(title: "Title 3", value: "Value 3", favorite: false),
        Item(title: "Title 4", value: "Value 4", favorite: true)
    ]
    
    @State var createNewItem = CreateItem()
    @State var path: NavigationPath = .init()
    
    var doneItems: [Item] {
        items.filter { $0.favorite }
    }
    
    var todoItems: [Item] {
        items.filter { !$0.favorite }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section(header: Text("Favorite")) {
                    ForEach(doneItems) { item in
                        ItemCell(items: $items, item: $items[getIndex(for: item)])
                            .environmentObject(settings)
                    }
                }
                Section(header: Text("all")) {
                    ForEach(todoItems) { item in
                        ItemCell(items: $items, item: $items[getIndex(for: item)])
                            .environmentObject(settings)
                    }
                }
            }
            .navigationDestination(for: Item.self) { item in
                DetailView(path: $path, item: $items[getIndex(for: item)], createNewItem: $createNewItem, items: $items, isNew: false)
            }
            .navigationDestination(for: CreateItem.self) { item in
                DetailView(path: $path, item: $items[0], createNewItem: $createNewItem, items: $items, isNew: true)
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let newNote = CreateItem()
                        path.append(newNote)
                    } label: {
                        Label("", systemImage: "plus")
                    }
                }
            }
        }
        .environmentObject(settings)
    }
    
    private func getIndex(for item: Item) -> Int {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else {
            fatalError("Item not found")
        }
        return index
    }
}

struct DetailView: View {

    @Binding var path: NavigationPath
    @Binding var item: Item
    @Binding var createNewItem: CreateItem
    @Binding var items: [Item]
    
    var isNew = false
    
    var body: some View {
        VStack {
            Group {
                TextField("Title", text: isNew ? $createNewItem.title : $item.title)
                TextEditor(text: isNew ? $createNewItem.value : $item.value)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    path = .init()
                } label: {
                    Text(isNew ? "Cancel" : "Back")
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if isNew {
                        if !createNewItem.title.isEmpty || !createNewItem.value.isEmpty {
                            items.append(Item(title: createNewItem.title, value: createNewItem.value, favorite: false))
                        }
                    }
                    createNewItem = CreateItem()
                    path = .init()
                } label: {
                    Text(isNew ? "Create" : "Save")
                }
            }
        }
    }
}

struct TestCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        TestCollectionView()
    }
}
