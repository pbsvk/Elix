//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/6/25.
//

import SwiftUI
import FirebaseCore
@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
