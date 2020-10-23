//
//  HomeVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 5/20/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    var countries = [Country]()
    
    let tableViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Table", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var tableViewContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getCountries()
        print(countries)
    }
    
    @objc func tableViewButtonTapped() {
        debugPrint("Tapped")
        navigationController?.pushViewController(DemoTableViewVC(), animated: true)
    }
}

// MARK: -UI Elements
extension HomeVC {
    func setupUI() {
        view.backgroundColor = .red
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.barTintColor = .white
        
        view.addSubview(tableViewButton)
        NSLayoutConstraint.activate([
            tableViewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            tableViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        tableViewButton.addTarget(self, action: #selector(tableViewButtonTapped), for: .touchUpInside)
    }
}

// MARK: -Methods
extension HomeVC {
    func getCountries() {
        Webservice().getAllCountries { result in
            switch result {
            case .success(let countries):
                DispatchQueue.main.async {
                    self.countries = countries
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
