//
//  Coordinator.swift
//  AdvancedCoordinator
//
//  Created by Omer Rahmanovic on 3/15/21.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
