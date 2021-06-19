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

final class Webservice {
    
    static let shared: Webservice = Webservice()
    
    private let oneDayAgoURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson"
    private let oneWeekAgoURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson"
    private let oneMonthAgoURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson"
    
    private init() {}
    
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
    
    func fetchFakeData(isElectric: Bool, brand: String, model: String ,completion: @escaping (String, Bool) -> ()) {
//        print("This print is from completion")
//
//        let message = "Peugeot 3008"
//        let isGoodOption = true
//
//        completion(message, isGoodOption)
        var message = checkCarQuality(isElectric, brand, model)
        var isGoodOption = false
        
        switch isElectric {
        case true:
            isGoodOption = true
            completion(message, isGoodOption)
        case false:
            isGoodOption = false
            completion(message, isGoodOption)
        default:
            print("DEFAULT FROM CLOSURE")
        }
    }
    
    func checkCarQuality(_ isElectric: Bool, _ brand: String, _ model: String) -> String {
        var message = ""
        if isElectric {
            message = "Electric car \(brand) \(model) is great option to buy. SUCCESS TRUE"
        } else {
            message = "No electric car \(brand) \(model) is very bad option to buy. FAIL FALSE"
        }
        
        return message
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
