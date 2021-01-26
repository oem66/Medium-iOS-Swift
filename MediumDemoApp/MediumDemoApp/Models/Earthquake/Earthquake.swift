//
//  Earthquake.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 1/26/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit

struct Earthquake: Decodable {
    var features: [EarthquakeDetails]?
}

struct EarthquakeDetails: Decodable {
    var properties: EarthquakeProperties?
    var geometry: EarthquakeGeometry?
}

struct EarthquakeProperties: Decodable {
    var mag: Double?
    var place: String?
    var tsunami: Int?
    var title: String?
}

struct EarthquakeGeometry: Decodable {
    var coordinates: [Double]?
}
