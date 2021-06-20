//
//  Vehicle.swift
//  SwiftConcepts
//
//  Created by Omer Rahmanovic on 6/20/21.
//

import Foundation

enum Car {
    case electric(String)
    case diesel(String)
    case petrol(String)
    case hybrid(String, String)
}

enum MilitaryVehicleType {
    case tank(String)
    case amphibious
    case LAV
}

indirect enum MilitaryVehicle {
    case armed(String, MilitaryVehicleType, Int) // Unit, Armed, Number of passengers
    case unarmed(String, Int) //unit, number of passengers
}

indirect enum Vehicle {
    case car(Car, Int) // number of passengers
    case ship(String) // speedboat, yacht, cargo ship, oil tanker
    case airplane(String) // private jet, commercial airline, cargo plane
    case military(MilitaryVehicle) // military unit(navy, marines, ...), armed,
}

final class VehicleManagement {
    static let shared = VehicleManagement()
    
    private init() { }
    
    internal func vehicleCheck(for vehicle: Vehicle) {
        switch vehicle {
        case .car:
            print("Car info: \(vehicle)")
        case .ship:
            print("Ship info: \(vehicle)")
        case .airplane:
            print("Airplane info: \(vehicle)")
        case .military:
            print("Military vehicle info: \(vehicle)")
        default:
            print("No vehicle")
        }
    }
}
