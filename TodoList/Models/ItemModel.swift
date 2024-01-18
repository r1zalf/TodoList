//
//  ItemModel.swift
//  TodoList
//
//  Created by Rizal Fahrudin on 17/01/24.
//

import Foundation


struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isDone: Bool
    
    
    init(id: String = UUID().uuidString, title: String, isDone: Bool = false) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
    
    func markAsDone() -> ItemModel {
        return ItemModel(id: id, title: title, isDone: !isDone)
    }
}
