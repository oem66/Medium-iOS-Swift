//
//  HomeVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 5/20/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    let tableViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Table", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupUI()
    }
    
    @objc func tableViewButtonTapped() {
        debugPrint("Tapped")
        navigationController?.pushViewController(DemoTableViewVC(), animated: true)
    }
}

extension HomeVC {
    func setupUI() {
        view.addSubview(tableViewButton)
        NSLayoutConstraint.activate([
            tableViewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            tableViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        tableViewButton.addTarget(self, action: #selector(tableViewButtonTapped), for: .touchUpInside)
    }
}
