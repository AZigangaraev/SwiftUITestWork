//
//  TabBar.swift
//  Test
//
//  Created by Максим Тарасов on 29.04.2023.
//

import SwiftUI

struct TabBar: View {
    @State var toggleIsOn: Bool = false
    var body: some View {
        
        TabView {
            NavigationStack {
                MainView(toggleIsOn: $toggleIsOn)
            }
                .tabItem {
                    VStack {
                        Image(systemName: "note.text")
                        Text("Notes")
                    }
                }
            
            SettingsView(toggleIsOn: $toggleIsOn)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
        }.accentColor(.black)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

