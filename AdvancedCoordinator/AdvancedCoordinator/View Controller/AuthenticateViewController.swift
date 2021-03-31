//
//  AuthenticateViewController.swift
//  AdvancedCoordinator
//
//  Created by Omer Rahmanovic on 3/31/21.
//

import UIKit

class AuthenticateViewController: UIViewController, Storyboarded {
    weak var coordinator: AuthenticateCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Authenticated"
        navigationController?.navigationBar.prefersLargeTitles = true
        print("AuthenticateView is loaded!")
    }
}
