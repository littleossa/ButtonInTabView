//
//  ContentView.swift
//  ButtonInTabView
//
//

import SwiftUI

struct ContentView: View {
    
    enum Selection {
        case list
        case favorite
        case addItem
    }
    
    @State private var selection: Selection = .list
    @State private var lastSelection: Selection = .list
    
    var body: some View {
        
        TabView(selection: $selection) {
            Text("List")
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    Text("List")
                }
                .tag(Selection.list)
            
            Text("Favorite")
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorite")
                }
                .tag(Selection.favorite)
            
            Text("AddButton")
                .tabItem {
                    Image(systemName: "plus")
                }
                .tag(Selection.addItem)
        }
        .onChange(of: selection) { _ in
            if selection == .addItem {
                print("Add Item or Do something")
                selection = lastSelection
                return
            }
            lastSelection = selection
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

