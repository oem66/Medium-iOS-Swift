//
//  Country.swift
//  SwiftConcepts
//
//  Created by Omer Rahmanovic on 6/21/21.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var topLevelDomain: [String]?
    var alpha2Code: String?
    var alpha3Code: String?
    var capital: String?
    var altSpellings: [String]?
    var region: String?
    var subregion: String?
    var population: Int32?
    var latlng: [Double]?
    var demonym: String?
    var area: Double?
    var gini: Double?
    var timezones: [String]?
    var borders: [String]?
    var nativeName: String?
    var numericCode: String?
    var currencies: [Currency]?
    var languages: [Language]?
    var flag: String?
    var regionalBlocks: [RegionalBlocks]?
    var cioc: String?
}

struct Currency: Decodable {
    var code: String?
    var name: String?
    var symbol: String?
}

struct Language: Decodable {
    var iso639_1: String?
    var iso639_2: String?
    var name: String?
    var nativeName: String?
}

struct RegionalBlocks: Decodable {
    var acronym: String?
    var name: String?
    var otherAcronyms: [String]?
    var otherNames: [String]?
}
