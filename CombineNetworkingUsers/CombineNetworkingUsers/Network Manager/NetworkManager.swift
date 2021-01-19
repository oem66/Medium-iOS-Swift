//
//  NetworkManager.swift
//  CombineNetworkingUsers
//
//  Created by Omer Rahmanovic on 1/18/21.
//

import UIKit
import Combine

class DataManager {
    
    private let urlString = "https://jsonplaceholder.typicode.com/users"
    private let countriesURL = "https://restcountries.eu/rest/v2/all"
    
    var usersPublisher: AnyPublisher<[User], Error> {
        let url = URL(string: urlString)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    var countriesPublisher: AnyPublisher<[Country], Error> {
        let url = URL(string: countriesURL)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Country].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
