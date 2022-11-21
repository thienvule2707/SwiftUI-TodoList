//
//  ListView.swift
//  SwiftUI-TodoList
//
//  Created by Le Thien Vu on 11/11/2022.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is first Todo", isCompleted: false),
        ItemModel(title: "This is second Todo", isCompleted: true),
        ItemModel(title: "This is third Todo", isCompleted: false),
        ItemModel(title: "This is fourth Todo", isCompleted: false),
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
//                ListRowView(title: item)
                ListRowView(item: item)
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: moveItem)
        }
        .listStyle(.plain)
        .navigationTitle(Text("Todo List 📝"))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
