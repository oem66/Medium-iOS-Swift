//
//  BuyViewController.swift
//  CoordinatorsSwift
//
//  Created by Omer Rahmanovic on 1/4/21.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {

    weak var coordinator: BuyCoordinator?
    var selectedProduct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Buy"
    }
}
