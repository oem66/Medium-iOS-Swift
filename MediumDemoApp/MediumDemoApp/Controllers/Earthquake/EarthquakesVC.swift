//
//  EarthquakesVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 1/26/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit
import Combine

class EarthquakesVC: UIViewController {
    
    let oneDayAgoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Past Day", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    let oneWeekAgoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Past 7 Days", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    let oneMonthAgoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Past 30 Days", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Earthquakes"
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.backgroundColor = .black
        
        view.addSubview(oneDayAgoButton)
        view.addSubview(oneWeekAgoButton)
        view.addSubview(oneMonthAgoButton)
        
        NSLayoutConstraint.activate([
            oneDayAgoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            oneDayAgoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            oneDayAgoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            oneDayAgoButton.heightAnchor.constraint(equalToConstant: 40),
            
            oneWeekAgoButton.topAnchor.constraint(equalTo: oneDayAgoButton.bottomAnchor, constant: 30),
            oneWeekAgoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            oneWeekAgoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            oneWeekAgoButton.heightAnchor.constraint(equalToConstant: 40),
            
            oneMonthAgoButton.topAnchor.constraint(equalTo: oneWeekAgoButton.bottomAnchor, constant: 30),
            oneMonthAgoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            oneMonthAgoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            oneMonthAgoButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        oneDayAgoButton.addTarget(self, action: #selector(oneDayAgoTapped), for: .touchUpInside)
        oneWeekAgoButton.addTarget(self, action: #selector(oneWeekAgoButtonTapped), for: .touchUpInside)
        oneMonthAgoButton.addTarget(self, action: #selector(oneMonthAgoTapped), for: .touchUpInside)
    }
    
    @objc func oneDayAgoTapped() {
        navigationController?.pushViewController(EarthquakeDayVC(), animated: true)
    }
    
    @objc func oneWeekAgoButtonTapped() {
        
    }
    
    @objc func oneMonthAgoTapped() {
        
    }
}
