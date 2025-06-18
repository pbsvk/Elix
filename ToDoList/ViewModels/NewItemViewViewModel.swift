//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert:Bool = false
    init () {
           
    }
    func save() {
        guard canSave else {
            return showAlert = true
        }
       
        //Get curret user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        // Save modelb
        let db = Firestore.firestore()
        db.collection("users").document(uId).collection("items").document(newId).setData(newItem.asDictionary())
        
    }
    
    var canSave:Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
    
}
