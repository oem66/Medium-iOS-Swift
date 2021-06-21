//
//  CountryURLs.swift
//  SwiftConcepts
//
//  Created by Omer Rahmanovic on 6/21/21.
//

import Foundation

enum Regions: String {
    case africa
    case americas
    case asia
    case europe
    case oceania
}

indirect enum CountryInfoEndpoint {
    case all
    case capital(String?)
    case region
}

struct CountryEndpoints {
    static let shared = CountryEndpoints()
    
    internal func getCountries(for type: CountryInfoEndpoint, _ capitalCity: String?, _ region: Regions?) -> URLComponents {
        switch type {
        case .all:
            return getAllCountries()
        case .capital(capitalCity):
            if let capital = capitalCity {
                return getByCapital(for: capital)
            }
        case .region:
            if let region = region {
                return getByRegion(for: region.rawValue)
            }
        default:
            debugPrint("Can not find URL!")
        }
        return URLComponents()
    }
    
    private func getAllCountries() -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "restcountries.eu"
        components.path = "/rest/v2/all"
        return components
    }
    
    private func getByCapital(for capitalCity: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "restcountries.eu"
        components.path = "/rest/v2/capital/\(capitalCity.lowercased())"
        return components
    }
    
    private func getByRegion(for region: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "restcountries.eu"
        components.path = "/rest/v2/region/\(region.lowercased())"
        return components
    }
}
