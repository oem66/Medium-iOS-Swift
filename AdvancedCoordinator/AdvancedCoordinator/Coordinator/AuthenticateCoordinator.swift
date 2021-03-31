//
//  CreateAccountCoordinator.swift
//  AdvancedCoordinator
//
//  Created by Omer Rahmanovic on 3/31/21.
//

import UIKit

class AuthenticateCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AuthenticateViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
