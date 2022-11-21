//
//  SwiftUI_TodoListApp.swift
//  SwiftUI-TodoList
//
//  Created by Le Thien Vu on 11/11/2022.
//

import SwiftUI

@main
struct SwiftUI_TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
