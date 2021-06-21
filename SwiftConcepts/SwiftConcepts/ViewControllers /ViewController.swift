//
//  ViewController.swift
//  SwiftConcepts
//
//  Created by Omer Rahmanovic on 6/20/21.
//

import UIKit
import Combine

class ViewController: UIViewController {

    let vwGolf = Vehicle.car(.diesel("VW Golf 7"), 5)
    let leopard2 = Vehicle.military(.armed("Marines", MilitaryVehicleType.tank("Leopard 2"), 4))
    
    let appleWatch = DataSource.Apple(Device.smartwatch("Apple Watch Series 6"))
    let iphone12Pro = DataSource.Apple(Device.smartphone("Apple iPhone 12 Pro"))
    let fitBitWatch = DataSource.FitBit(Device.smartwatch("FitBit Versa 3"))
    
    private var countriesSubscriber: AnyCancellable?
    private var countries = [Country]() {
        didSet {
//            tableView.reloadData()
            print(countries)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
        
        checkVehicles()
        healthDataImport()
        
        getCountries()
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

    private func getCountries() {
        countriesSubscriber = CountryService.shared.getAllCountries().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("Data downloaded!")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }, receiveValue: { [weak self] countries in
            guard let self = self else { return }
            self.countries = countries
            print("Countries = \(countries)")
        })
    }
    
    private func getCountriesByCapital(capitalCity: String) {
        
    }
    
    private func getCountriesByRegion(region: Regions) {
        
    }
}

