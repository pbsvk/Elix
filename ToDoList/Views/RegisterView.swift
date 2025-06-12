//
//  RegisterView.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View
        {
            NavigationView
            {
                ZStack {
                    VStack(spacing: 0) {
                        HeaderView(routename: "Sign Up")
                        
                        Spacer(minLength: 32)
                        
                        VStack(spacing: 18) {
                            TextField("Email", text: $email)
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(12)
                                .autocapitalization(.none)
                            
                            SecureField("Password", text: $password)
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(12)
                            
                            Button(action: {
                                // Login action
                            }) {
                                Text("Sign Up")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(12)
                            }
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
