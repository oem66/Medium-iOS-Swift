//
//  NetworkManager.swift
//  ListNetworkingApp
//
//  Created by Omer Rahmanovic on 1/4/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var dataList = [VehicleTypes.VType]()
    
    init() {
        isLoading = false
        guard let url = URL(string: "http://developer.dialmech.com/mechanic/mechanic_type/vehicle_types") else {
            return
        }
        
        var key = "noKey"
        let params = "access_key=\(key)"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                self.isLoading = true
            }
            if error == nil {
                if data != nil {
                    do {
                        print(String(data: data!, encoding: .utf8)!)
                        let myServiceResponse = try JSONDecoder().decode(VehicleTypes.self, from: data!)
                        DispatchQueue.main.async {
                            self.dataList = myServiceResponse.data
                        }
                    } catch let exception {
                        print(exception)
                    }
                } else {
                    print("Something went wrong!")
                }
            } else {
                print(error?.localizedDescription ?? "N/A")
            }
        }
        task.resume()
    }
    
}
