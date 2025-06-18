//
//  RegisterView.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//

import SwiftUI

struct RegisterView: View {
@StateObject var viewModel = RegisterViewViewModel()
    var body: some View
        {
            NavigationView
            {
                ZStack {
                    VStack(spacing: 0) {
                        HeaderView(routename: "Sign Up")
                        
                        Spacer(minLength: 32)
                        
                        VStack(spacing: 18) {
                            TextField("Full Name", text: $viewModel.fullname)
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(12)
                                .autocapitalization(.none)
                                .autocorrectionDisabled(true)
                            
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
                            
                            TLButton(title: "Sign Up", action: {viewModel.register()}, backgroundColor: .green)
                           
                        }
                        .padding(.horizontal, 28)
                        
                        Spacer()
                        }
                        .padding(.bottom, 40)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
            }
        }


#Preview {
    RegisterView()
}
