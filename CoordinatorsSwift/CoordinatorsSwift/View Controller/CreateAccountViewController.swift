//
//  CreateAccountViewController.swift
//  CoordinatorsSwift
//
//  Created by Omer Rahmanovic on 1/4/21.
//

import UIKit

class CreateAccountViewController: UIViewController, Storyboarded {

    weak var coordinator: CreateAccountCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Create Account"
    }
}
