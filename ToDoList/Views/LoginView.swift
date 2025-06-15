//
//  LoginView.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView
        {
            ZStack {
                VStack(spacing: 0) {
                    HeaderView(routename: "Login")
                    
                    Spacer(minLength: 32)
                    
                    VStack(spacing: 18) {
                        TextField("Email", text: $viewModel.email)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(12)
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                        
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(12)
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundStyle(.red)
                        }
                        
                        TLButton(title: "Log In", action: {viewModel.login()}, backgroundColor: .blue)
                    }
                    .padding(.horizontal, 28)
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Text("Don't have an account?")
                        NavigationLink("Sign Up", destination: RegisterView())
                        .foregroundColor(.blue)
                    }
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
        }
    }
}


#Preview {
    LoginView()
}
