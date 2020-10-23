//
//  Constants.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 10/23/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import Foundation

final class APIEndpoints {
    var GetAllCountries = Endpoint.countries.rawValue
}

enum Endpoint: String {
    case countries = "https://restcountries.eu/rest/v2/all"
}
