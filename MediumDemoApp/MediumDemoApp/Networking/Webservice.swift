//
//  API Calls.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 10/23/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import Foundation

class Webservice {
    
    func getAllCountries(completion: @escaping (Result<[Country],Error>) -> ()) {
        guard let url = URL(string: "\(APIEndpoints().GetAllCountries)") else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let countries = try! JSONDecoder().decode([Country].self, from: data!)
                completion(.success(countries))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
    
    static func fetchFakeData(completion: @escaping (String, Bool) -> ()) {
        print("This print is from completion")
        
        let message = "Peugeot 3008"
        let isGoodOption = true
        
        completion(message, isGoodOption)
    }
}
