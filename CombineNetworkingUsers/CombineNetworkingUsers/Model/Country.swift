//
//  Country.swift
//  CombineNetworkingUsers
//
//  Created by Omer Rahmanovic on 1/18/21.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var capital: String?
    var region: String?
    var population: Int32?
    var currencies: [Currency]?
}

struct Currency: Decodable {
    var code: String?
    var name: String?
}
