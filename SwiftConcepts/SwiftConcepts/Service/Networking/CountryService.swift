//
//  CountryService.swift
//  SwiftConcepts
//
//  Created by Omer Rahmanovic on 6/21/21.
//

import Foundation
import Combine

final class CountryService: CountryNetworkingProtocol {
    static let shared = CountryService()
    
    init() { }
    
    func getAllCountries() -> AnyPublisher<[Country], Error> {
        print("getAllCountries Method")
        return URLSession.shared.dataTaskPublisher(for: CountryEndpoints.shared.getCountries(for: .all, nil, nil).url!)
            .map { $0.data }
            .decode(type: [Country].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func getByCapital(for capitalCity: String) -> AnyPublisher<Country, Error> {
        return URLSession.shared.dataTaskPublisher(for: CountryEndpoints.shared.getCountries(for: .capital(""), capitalCity, nil).url!)
            .map { $0.data }
            .decode(type: Country.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func getByRegion(for region: Regions.RawValue) -> AnyPublisher<[Country], Error> {
        return URLSession.shared.dataTaskPublisher(for: CountryEndpoints.shared.getCountries(for: .region, nil, Regions.europe).url!)
            .map { $0.data }
            .decode(type: [Country].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
