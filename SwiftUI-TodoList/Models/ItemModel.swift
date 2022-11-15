//
//  ItemModel.swift
//  SwiftUI-TodoList
//
//  Created by Le Thien Vu on 14/11/2022.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
