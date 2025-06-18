//
//  ContentView.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/6/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isLoading {
                   // Show a simple loading spinner while waiting for Firebase
                   ProgressView()
               } else if viewModel.isSignedIn , !viewModel.currentUserId.isEmpty{
            accountView
        }
        else{
            LoginView()
        }
        
    }
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("To-Do List")
                }
            
            ProfileView()
                .tabItem{
                    Image(systemName: "person.circle")
                    Text("Settings")
                }
        }

    }
    
    
    
}

#Preview {
    MainView()
}
