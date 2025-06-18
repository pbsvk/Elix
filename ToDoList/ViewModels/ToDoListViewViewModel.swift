//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//
import FirebaseFirestore
import Foundation
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("items").document(id).delete()
    }
}
