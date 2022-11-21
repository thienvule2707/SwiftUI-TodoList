//
//  ListViewModel.swift
//  SwiftUI-TodoList
//
//  Created by Le Thien Vu on 16/11/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is first Todo", isCompleted: false),
            ItemModel(title: "This is second Todo", isCompleted: true),
            ItemModel(title: "This is third Todo", isCompleted: false),
            ItemModel(title: "This is fourth Todo", isCompleted: false),
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}
