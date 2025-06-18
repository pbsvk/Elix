//
//  ProfileView.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                }
                else{
                    ProgressView()
                }
            }.navigationTitle(Text("Profile"))

        }
        .onAppear{viewModel.fetchUser()}
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
                VStack(spacing: 20) {
                    // Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.black)
                        .background(Circle().fill(Color.white))
                        .clipShape(Circle())
                        .shadow(radius: 6)
                    
                    // User Info
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Label("Name", systemImage: "person.fill")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text(user.name)
                                .font(.body)
                        }
                        
                        HStack {
                            Label("Email", systemImage: "envelope.fill")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text(user.email)
                                .font(.body)
                        }
                        
                        HStack {
                            Label("Member Since", systemImage: "calendar")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time:.shortened))").font(.body).foregroundStyle(.gray)
                                .font(.body)
                        }
                    }
                    .padding(.horizontal, 24)
                    TLButton(title: "Log Out", action:{viewModel.logout()}, backgroundColor: .red)
                }
                .padding()
//                .background(
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(Color(.systemBackground))
//                        .shadow(radius: 10)
//                )
                .padding()
                Spacer()
            
        
        
    }
}

#Preview {
    ProfileView()
}
