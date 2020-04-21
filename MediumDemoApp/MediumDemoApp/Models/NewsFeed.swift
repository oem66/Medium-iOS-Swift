//
//  NewsFeed.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 4/21/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import Foundation

struct NewsFeed: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
}
