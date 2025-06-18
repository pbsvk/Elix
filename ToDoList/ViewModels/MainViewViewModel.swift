//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//
import FirebaseAuth
import Foundation
class MainViewViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    @Published var isLoading: Bool = true
    private var handler: AuthStateDidChangeListenerHandle?
   
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.currentUserId = user?.uid ?? ""
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                self?.isLoading = false
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
