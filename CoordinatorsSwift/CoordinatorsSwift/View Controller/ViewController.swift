//
//  ViewController.swift
//  CoordinatorsSwift
//
//  Created by Omer Rahmanovic on 1/4/21.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    @IBOutlet weak var product: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
    
}
