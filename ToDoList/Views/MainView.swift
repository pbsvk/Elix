//
//  ContentView.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/6/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            LoginView()
        }
        .padding()
    }
}

#Preview {
    MainView()
}
