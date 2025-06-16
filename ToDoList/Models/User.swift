//
//  User.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
