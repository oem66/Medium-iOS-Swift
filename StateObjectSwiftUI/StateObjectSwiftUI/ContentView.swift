//
//  ContentView.swift
//  StateObjectSwiftUI
//
//  Created by Omer Rahmanovic on 6/12/21.
//

import SwiftUI

class Car: ObservableObject {
    @Published var brand = "Tesla"
    @Published var model = "Model 3"
}

struct ContentView: View {
    
    @StateObject var car = Car()
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: CarInfoView(car: car)) {
                Text("Show car informations")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct CarInfoView: View {
    
    @ObservedObject var car: Car
    
    var body: some View {
        HStack {
            Text(car.brand)
                .foregroundColor(.blue)
            Text(car.model)
                .foregroundColor(.orange)
        }
        .padding()
    }
}
