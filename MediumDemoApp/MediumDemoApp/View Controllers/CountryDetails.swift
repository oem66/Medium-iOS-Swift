//
//  CountryDetails.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 10/27/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit

class CountryDetailVC: UIViewController {
    
    var country = Country()
    
    var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var nameLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "\(country.name!)"
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .systemPink
        
        view.backgroundColor = .black
        
        view.addSubview(container)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        container.backgroundColor = .yellow
        
        container.addSubview(nameLbl)
        NSLayoutConstraint.activate([
            nameLbl.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            nameLbl.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            nameLbl.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20)
        ])
        nameLbl.text = "\(country.name!)"
    }
}
