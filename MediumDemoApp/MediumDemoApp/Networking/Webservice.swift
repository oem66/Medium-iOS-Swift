//
//  API Calls.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 10/23/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import Foundation
import UIKit
import Combine

class Webservice {
    
    private let oneDayAgoURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson"
    private let oneWeekAgoURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson"
    private let oneMonthAgoURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson"
    
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
    
    var earthquakesDayPublisher: AnyPublisher<Earthquake, Error> {
        let url = URL(string: oneDayAgoURL)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Earthquake.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    var earthquakeWeekPublisher: AnyPublisher<Earthquake, Error> {
        let url = URL(string: oneWeekAgoURL)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Earthquake.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    var earthquakeMonthPublisher: AnyPublisher<Earthquake,Error> {
        let url = URL(string: oneMonthAgoURL)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Earthquake.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
