//
//  MainCoordinator.swift
//  AdvancedCoordinator
//
//  Created by Omer Rahmanovic on 3/15/21.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buySubscription() {
        let child = BuyCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func authenticateResult(username: String, password: String, completion: @escaping (String, Bool) ->()) {
        var message = ""
        var isAuthenticated = false
        if username == "stuxnet" && password == "secure100" {
            message = "Access granted!"
            isAuthenticated = true
            completion(message, isAuthenticated)
        } else {
            message = "Access denied!"
            isAuthenticated = false
            completion(message, isAuthenticated)
        }
        
    }
    
    func authenticate(_ username: String, _ password: String) {
        let child = AuthenticateCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        
        authenticateResult(username: username, password: password) { (message, isAuthenticated) in
            if isAuthenticated {
                print("Auth message: \(message)")
                child.start()
            } else {
                print("Username: \(username) is not authenticated! Message: \(message)")
            }
        }
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
        
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
    }
}

// Domaca zadaca: MainCoordinator -> SettingsCoordinator -> ProfileCoordinator za sljedeci cas.
