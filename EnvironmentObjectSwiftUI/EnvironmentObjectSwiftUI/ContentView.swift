//
//  ContentView.swift
//  EnvironmentObjectSwiftUI
//
//  Created by Omer Rahmanovic on 6/12/21.
//

import SwiftUI

class Person: ObservableObject {
    @Published var name = ""
    @Published var surname = ""
}

struct PersonView: View {
    
    @EnvironmentObject var person: Person
    
    var body: some View {
        VStack {
            Text("Name: \(person.name)")
                .padding()
            Text("Surname: \(person.surname)")
        }
    }
}

struct ContentView: View {
    
    @StateObject var person = Person()
    
    @State var alertIsPresented = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                TextField("Name", text: $person.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                TextField("Surname", text: $person.surname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                Button("SAVE") {
                    alertIsPresented.toggle()
                }
                .alert(isPresented: $alertIsPresented) {
                    Alert(title: Text("User Saved"), message: Text("User credentials have been saved!"), dismissButton: .default(Text("OK")))
                }
                
                NavigationLink(destination: PersonView()) {
                    Text("Show person details")
                        .bold()
                        .foregroundColor(.red)
                }
                .padding(.top, 50)
            }
            .padding(20)
            .frame(height: 200)
        }
        .environmentObject(person)
    }
}
