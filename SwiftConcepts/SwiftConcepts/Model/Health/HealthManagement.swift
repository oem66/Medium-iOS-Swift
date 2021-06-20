//
//  HealthManagement.swift
//  SwiftConcepts
//
//  Created by Omer Rahmanovic on 6/20/21.
//

import Foundation

enum Device {
    case smartwatch(String)
    case smartphone(String)
    case chestStrap(String)
}

indirect enum DataSource {
    case Apple(Device)
    case Garmin(Device)
    case FitBit(Device)
    case Whoop(Device)
}

final class HealthManagement {
    static let shared = HealthManagement()
    
    private init() {}
    
    internal func importData(for dataSource: DataSource) {
        switch dataSource {
        case .Apple:
            print("Importing data from Apple device... \(dataSource)")
        case .Garmin:
            print("Importing data from Garmin device... \(dataSource)")
        case .FitBit:
            print("Importing data from FitBit device... \(dataSource)")
        case .Whoop:
            print("Importing data from Whoop device... \(dataSource)")
        default:
            print("No data source")
        }
    }
    
    internal func importFromDevice(for device: Device) {
        switch device {
        case .smartwatch:
            print("Smartwatch import has started!")
        case .smartphone:
            print("Smartphone import has started!")
        case .chestStrap:
            print("Chest strap import has started!")
        default:
            print("No device")
        }
    }
}
