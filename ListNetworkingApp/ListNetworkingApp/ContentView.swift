//
//  ContentView.swift
//  ListNetworkingApp
//
//  Created by Omer Rahmanovic on 1/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            VStack {
                if networkManager.isLoading {
                    if networkManager.dataList.isEmpty {
                        Text("No data found here")
                    } else {
                        List(networkManager.dataList) { model in
                            VehicleTypeRow(model: model)
                        }
                    }
                } else {
                    Text("Loading...")
                }
            }
        }
        .navigationBarTitle("Vehicles")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
