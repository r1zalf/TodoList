//
//  ListViewModel.swift
//  TodoList
//
//  Created by Rizal Fahrudin on 17/01/24.
//

import Foundation


class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    
    init() {
        getItems()
    }
    
    let key = "list_item"
    
    func add(item: ItemModel) {
        items.append(item)
    }
    
    func update(item: ItemModel) {
        if let index = items.lastIndex(where: { $0.id == item.id }) {
            items[index] = items[index].markAsDone()
        }
    }
    
    func delete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func move(indexSet: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indexSet, toOffset: newOffset)
    }
    
    
    func saveItems() {
        if let stringData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(stringData, forKey: key)
        }
    }
    
    func getItems() {
        if let data = UserDefaults.standard.data(forKey: key), let safeData = try? JSONDecoder().decode([ItemModel].self, from: data) {
            items = safeData
        }
    }
}
