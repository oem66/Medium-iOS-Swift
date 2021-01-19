//
//  User.swift
//  CombineNetworkingUsers
//
//  Created by Omer Rahmanovic on 1/18/21.
//

import Foundation

struct User: Decodable {
    let name: String
    let company: Company
}

struct Company: Decodable {
    let name: String
}
