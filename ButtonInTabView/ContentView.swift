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
                    Label("List",
                          systemImage: "list.bullet.rectangle")
                }
                .tag(Selection.list)
            
            Text("Favorite")
                .tabItem {
                    Label("Favorite",
                          systemImage: "star")
                }
                .tag(Selection.favorite)
            
            Text("AddButton")
                .tabItem {
                    Image(systemName: "plus")
                }
                .tag(Selection.addItem)
        }
        .onChange(of: selection) { _ in
            switch selection {
                
            case .list, .favorite:
                lastSelection = selection

            case .addItem:
                print("Add Item or Do something")
                selection = lastSelection
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

