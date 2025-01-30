//
//  LoginView.swift
//  FigmaToSwiftUI
//
//  Created by Tech Exactly iPhone 6 on 29/01/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                VStack(spacing: 10){
                    Text("Hello Again!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Welcome Back You've Been Missed!")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                .padding(.vertical, 40)
                
                VStack(alignment: .leading, spacing:10){
                    Text("Email Address")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    TextField("Email Address", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(28)
                        .padding(.horizontal)
                }
                .padding(.vertical)
                
                VStack(alignment: .leading, spacing:10){
                    Text("Password")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(28)
                        .padding(.horizontal)
                    
                    HStack{
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Recovery Password")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Button(action: {
                    // Handle sign in action
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(28)
                        .padding(.horizontal)
                }
                
                HStack {
                    VStack { Divider() }
                    Text("or")
                    VStack { Divider() }
                }
                .padding(.horizontal)
                
                VStack (spacing: 50){
                    Button(action: {
                        // Handle Google sign in action
                    }) {
                        HStack {
                            Image(systemName: "g.circle.fill")
                                .foregroundColor(.red)
                            Text("Sign in with Google")
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(28)
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("Don't Have An Account?")
                        Button(action: {
                            // Handle sign up action
                        }) {
                            Text("Sign Up For Free")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding(.top)
            }
            .padding()
        }
        .background(Color.gray.opacity(0.1)) // Apply background color to ScrollView
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
