//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item : ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title).font(.headline).fontWeight(.semibold)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date:.abbreviated, time:.shortened))").font(.body).foregroundStyle(.gray)
                
            }
            Spacer()
            Button {
                viewModel.toggleIsCompleted(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }

        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
