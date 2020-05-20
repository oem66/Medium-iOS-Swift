//
//  CurrencyRate.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 5/17/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit

struct CurrencyRate: Codable {
    var result: String?
    var documentation: String?
    var terms_of_use: String?
    var time_zone: String?
    var base: String?
    var conversion_rates: ConversionRate?
    
//    init() {
//        result = ""
//        documentation = ""
//        terms_of_use = ""
//        time_zone = ""
//        base = ""
//        conversion_rates = nil
//    }
}
