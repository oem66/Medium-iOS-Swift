//
//  OptionalsDemoVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 1/25/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit

// MARK: - Test classes
class Car {
    var owner: Person?
    var yearOfProduction: Int?
    var brand: String?
    var model: String?
}

class Person {
    var name = "John"
    var surname = "Smith"
    var age: Int?
    var residence: Residence?
}

class Residence {
    var country: String?
    var city: String?
}

class OptionalsDemoVC: UIViewController {
    
    // Cars
    var vwGolf = Car()
    var audiA6 = Car()
    var audiA4 = Car()
    var vwTiguan = Car()
    var polestar2 = Car()
    
    var john = Person()
    var steve = Person()
    var mark = Person()
    
    var munich = Residence()
    var stuttgart = Residence()
    var amsterdam = Residence()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        var audi = Car()
        audi.brand = "Audi"
        audi.model = "A6"
        audi.yearOfProduction = 2020
        
        john.name = "John"
        john.surname = "Waltt"
        john.age = 33
        munich.country = "Germany"
        munich.city = "Munich"
        
        john.residence = munich
        audi.owner = john
        
//        var testCar = registerCar(car: vwGolf)
//        var audiCar = registerSuccessCar(car: audi)
        var audiCar = earlyExitRegistration(car: audi)
        
        print("Car \(audiCar.brand)")
    }
    
    private func registerCar(car: Car?) -> Car {
        if let owner = car?.owner?.name {
            showCustomAlertFirst(title: "\(car?.brand) \(car?.model)", message: "You have successfully registered your car!", actionTitle: "OK")
            return Car()
        } else {
            print("YOUR CAR IS NOT REGISTERED")
            showCustomAlertFirst(title: "Failed!", message: "Your car has not been registered", actionTitle: "OK")
        }
        return Car()
    }
    
    private func registerSuccessCar(car: Car?) -> Car {
        if let carN = car,
           let carOwnerName = car?.owner?.name,
           let carOwnerResidenceCity = car?.owner?.residence?.city,
           let ownerAge = car?.owner?.age {
            showCustomAlertSecond(title: "Congrats \(carOwnerName)", message: "Your \(carN.brand!) \(carN.model!) has been registered!", actionTitle: "OK", actionTitle2: "Close")
            return carN
        } else {
            showCustomAlertFirst(title: "Failed to register", message: "Car couldn't bee registered!", actionTitle: "OK")
            return Car()
        }
    }
    
    private func earlyExitRegistration(car: Car) -> Car {
        guard let carOwnerAge = car.owner?.age, carOwnerAge > 18 else {
            showCustomAlertFirst(title: "Registration Failed", message: "Car is not registered", actionTitle: "OK")
            return Car()
        }
        return car
    }
}

extension OptionalsDemoVC: AlertProtocol {
    func showCustomAlertFirst(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func showCustomAlertSecond(title: String, message: String, actionTitle: String, actionTitle2: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: actionTitle2, style: .destructive, handler: nil))
        present(alert, animated: true)
    }
    
    func showCustomAlertThird(title: String, message: String, actionTitle: String, actionTitle2: String, actionTitle3: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: actionTitle2, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: actionTitle3, style: .destructive, handler: nil))
        present(alert, animated: true)
    }
}
