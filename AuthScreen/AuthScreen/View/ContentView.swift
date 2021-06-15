//
//  ContentView.swift
//  AuthScreen
//
//  Created by Omer Rahmanovic on 6/15/21.
//

import SwiftUI
import Combine  

struct ContentView: View {
    
    @StateObject private var loginFormViewModel = LoginFormVM()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("USERNAME")) {
                        TextField("Username", text: $loginFormViewModel.username)
                            .autocapitalization(.none)
                    }
                    
                    Section(header: Text("PASSWORD"), footer: Text(loginFormViewModel.inlineErrorForPassword).foregroundColor(.red)) {
                        SecureField("Password", text: $loginFormViewModel.password)
                        SecureField("Password confirmation", text: $loginFormViewModel.passwordConfirmation)
                    }
                }
                Button(action: {}) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 60)
                        .overlay(
                            Text("Continue")
                                .foregroundColor(.white)
                                .bold()
                        )
                }
                .padding()
                .disabled(!loginFormViewModel.isValid)
            }
            .navigationTitle("Sign up")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
