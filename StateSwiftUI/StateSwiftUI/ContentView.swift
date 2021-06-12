//
//  ContentView.swift
//  StateSwiftUI
//
//  Created by Omer Rahmanovic on 6/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var credentialsValid = false
    
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            
            Button("SAVE") {
                validateFields(username, email)
            }
            .alert(isPresented: $credentialsValid) {
                Alert(title: Text("Invalid credentials"), message: Text("Username and email are required fields."), dismissButton: .default(Text("OK")))
            }
        }
        .padding(50)
        
        ZStack {
            RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                .fill(Color(red: 241/255, green: 241/255, blue: 249/255))
            VStack {
                Text("\(username)")
                    .padding()
                Text("\(email)")
                    .padding()
            }
        }
        .padding(40)
    }
    
    private func validateFields(_ username: String, _ email: String) {
        if username == "" || email == "" {
            credentialsValid.toggle()
        }
    }
}
