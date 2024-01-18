//
//  TodoListApp.swift
//  TodoList
//
//  Created by Rizal Fahrudin on 16/01/24.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    let listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }.environmentObject(listViewModel)
    }
}
