//
//  CreateAccountCoordinator.swift
//  CoordinatorsSwift
//
//  Created by Omer Rahmanovic on 1/5/21.
//

import UIKit

class CreateAccountCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
