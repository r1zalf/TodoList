//
//  ListViewRowView.swift
//  TodoList
//
//  Created by Rizal Fahrudin on 17/01/24.
//

import SwiftUI

struct ListViewRowView: View {
    
    var item: ItemModel
    
    var body: some View {
        Label(
            title: {
                Text(item.title)
            },
            icon: {
                Image(systemName: item.isDone ?  "checkmark.circle" : "circle")
                    .foregroundStyle(item.isDone ? .green : .red )
            }
        )
        .font(.title2)
        .padding(.vertical, 8)
    }
}


#Preview {
    
    Group {
        ListViewRowView(item: ItemModel(title: "Task 1", isDone: false))
        ListViewRowView(item: ItemModel(title: "Task 1", isDone: true))
    }.previewLayout(.sizeThatFits)
}
