//
//  AppCoordinator.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 4/16/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get }
    var navigationController: UINavigationController { get set }
    
    func start()
}

final class AppCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    private(set) var childCoordinators: [Coordinator] = [] //nothing can alter this outside of this class
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = HomeVC.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        print("====================| CHILD DID FINISH |====================")
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    // Navigation back
    // Because this is not handled by our coordinator we need to inherit UINavigationControllerDelegate and NSObject so delegate method can handle navigation back
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let homeVC = fromViewController as? HomeVC {
            childDidFinish(homeVC.coordinator)
        }
    }
}
