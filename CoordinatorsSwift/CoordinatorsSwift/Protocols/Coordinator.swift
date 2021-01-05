//
//  Coordinator.swift
//  CoordinatorsSwift
//
//  Created by Omer Rahmanovic on 1/4/21.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
