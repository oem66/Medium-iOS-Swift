//
//  BuyViewController.swift
//  AdvancedCoordinator
//
//  Created by Omer Rahmanovic on 3/15/21.
//

import Foundation
import UIKit

class BuyViewController: UIViewController, Storyboarded {
    weak var coordinator: BuyCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
    }
}
