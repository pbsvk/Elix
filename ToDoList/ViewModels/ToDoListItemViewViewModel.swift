//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class ToDoListItemViewViewModel: ObservableObject {
    
    init () {
        
    }
    
    func toggleIsCompleted(item: ToDoListItem) {
//        var itemCopy = item
//        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("items")
            .document(item.id)
            .updateData(["isDone": !item.isDone])
            
    }
}
