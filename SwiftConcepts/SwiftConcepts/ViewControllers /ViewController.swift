//
//  ViewController.swift
//  SwiftConcepts
//
//  Created by Omer Rahmanovic on 6/20/21.
//

import UIKit

class ViewController: UIViewController {

    let vwGolf = Vehicle.car(.diesel("VW Golf 7"), 5)
    let leopard2 = Vehicle.military(.armed("Marines", MilitaryVehicleType.tank("Leopard 2"), 4))
    
    let appleWatch = DataSource.Apple(Device.smartwatch("Apple Watch Series 6"))
    let iphone12Pro = DataSource.Apple(Device.smartphone("Apple iPhone 12 Pro"))
    let fitBitWatch = DataSource.FitBit(Device.smartwatch("FitBit Versa 3"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
        
        checkVehicles()
        healthDataImport()
    }
    
    fileprivate func checkVehicles() {
        VehicleManagement.shared.vehicleCheck(for: vwGolf)
        print("==========================================")
        VehicleManagement.shared.vehicleCheck(for: leopard2)
    }
    
    fileprivate func healthDataImport() {
        HealthManagement.shared.importData(for: appleWatch)
        HealthManagement.shared.importFromDevice(for: Device.smartwatch("Apple Watch Series 6"))
    }

    private func viewSetup() {
        title = "Home"
        view.backgroundColor = .tertiarySystemBackground
    }

}

