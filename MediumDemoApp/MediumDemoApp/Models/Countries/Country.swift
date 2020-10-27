//
//  Country.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 10/23/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var alpha3Code: String?
    var capital: String?
    var region: String?
    var subregion: String?
    var population: Double?
    var latlng: [Double]?
    var borders: [String]?
    var flag: String?
}
