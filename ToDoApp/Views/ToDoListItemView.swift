//
//  ToDoListItemView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("\(formattedDueDate())")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }) {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
                    .font(.title2)
            }
        }
        .padding(.vertical, 8)
    }
    
    private func formattedDueDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: Date(timeIntervalSince1970: item.dueDate))
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(
            item: ToDoListItem(
                id: "123",
                title: "Get Milk",
                dueDate: Date().timeIntervalSince1970,
                createdDate: Date().timeIntervalSince1970,
                isDone: true
            )
        )
    }
}

