//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by retxano on 13/9/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var items: [DataItem]
    
    var body: some View {
        VStack {
            Text("Tap on this button to add data")
            Button("Add Item") {
                addItem()
            }
            List{
                ForEach(items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Button {
                            updateItem(item)
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        }
                        
                    }
                }
                .onDelete { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                }
            }
        }
        .padding()
    }
    
    func addItem() {
        //Create item
        let item = DataItem(name: "Test Item")
        //Add item to a data context
        context.insert(item)
    }
    
    func deleteItem(_ item: DataItem) {
        context.delete(item)
    }
    
    func updateItem(_ item: DataItem) {
        item.name = "Item updated"
        try? context.save()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: DataItem.self)
}
