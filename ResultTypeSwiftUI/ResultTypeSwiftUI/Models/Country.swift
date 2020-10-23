//
//  Country.swift
//  ResultTypeSwiftUI
//
//  Created by Omer Rahmanovic on 10/17/20.
//

import Foundation

struct Country: Codable, Hashable {
    var name: String?
    var topLevelDomain: [String]?
    var alpha3Code: String?
    var callingCodes: [String]?
    var capital: String?
    var region: String?
    var subRegion: String?
    var population: Int32?
    var latlng: [Double]?
    var demony: String?
    var area: Double?
    var timezones: [String]?
    var borders: [String]?
    var nativeName: String?
    var currencies: [Currency]?
    var languages: [Language]?
    var flag: String?
}

struct Currency: Codable, Hashable {
    var code: String?
    var name: String?
    var symbol: String?
}

struct Language: Codable, Hashable {
    var name: String?
    var nativeName: String?
}
