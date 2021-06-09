//
//  User.swift
//  DemoCombineSwiftUI
//
//  Created by Omer Rahmanovic on 6/9/21.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: Int?
    let name: String?
    let email: String?
}
