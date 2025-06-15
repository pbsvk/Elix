//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//
import FirebaseAuth
import Foundation
class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){
        
    }
    
    func login(){
        guard validate() else {
            return
            
        }
        // Try to login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
   private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please enter email and password"
            return false        }
        guard email.trimmingCharacters(in: .whitespaces).contains("@") && email.contains(".") else {
            errorMessage = "Invalid email format"
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Password should be atleast 6 characters long"
            return false
        }
        return true
    }
    
    }
