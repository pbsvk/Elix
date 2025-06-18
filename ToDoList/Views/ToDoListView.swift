//
//  ToDoListitemsView.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//

import SwiftUI
import FirebaseFirestore
struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]

    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/items")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items){
                    item in ToDoListItemView(item: item)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive){
                                viewModel.delete(id: item.id)
                            }label:{
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }.listStyle(PlainListStyle())
                
            }.navigationTitle(Text("Elix"))
                .toolbar{
                    Button{
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }.sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
        }
    }
}

#Preview {
    ToDoListView(userId: "Nx99TVrLPwfBw954wHGlv3nHoz52")
}
