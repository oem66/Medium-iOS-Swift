//
//  NetworkingProtocol.swift
//  SwiftConcepts
//
//  Created by Omer Rahmanovic on 6/21/21.
//

import Foundation
import Combine

protocol CountryNetworkingProtocol {
    func getAllCountries() -> AnyPublisher<[Country], Error>
    func getByCapital(for capitalCity: String) -> AnyPublisher<Country, Error>
    func getByRegion(for region: Regions.RawValue) -> AnyPublisher<[Country], Error>
}
