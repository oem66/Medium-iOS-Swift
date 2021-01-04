//
//  VehicleType.swift
//  ListNetworkingApp
//
//  Created by Omer Rahmanovic on 1/4/21.
//

import Foundation

class VehicleTypes: Codable, Identifiable {
    var status: Bool = false
    var message: String? = nil
    var data: [VType] = [VType]()
    
    class VType: Codable, Identifiable {
        var id: String? = nil
        var type: String? = nil
        var type_hint: String? = nil
        var is_selected: Bool = false
    }
}
