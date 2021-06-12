//
//  ContentView.swift
//  ObservedObjectSwiftUI
//
//  Created by Omer Rahmanovic on 6/12/21.
//

import SwiftUI

class CarMileage: ObservableObject {
    @Published var mileage = 0
}

// This view contains ownership of CarMileage class instance
struct CarView: View {
    
    @ObservedObject var carMileage: CarMileage
    
    var body: some View {
        Button("Increase mileage") {
            carMileage.mileage += 1550
        }
    }
}

// This view is just notified when state of CarMileage instance is changed
struct ContentView: View {
    
    @StateObject var carMileage = CarMileage()
    
    var body: some View {
        VStack {
            Text("Car mileage is \(carMileage.mileage)")
                .padding(.bottom, 20)
            CarView(carMileage: carMileage)
        }
    }
}
