//
//  HomeVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 5/20/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit
import SnapKit
import UserNotifications

class HomeVC: UIViewController {
    
    var countries = [Country]()
    
    let tableViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Demo TableView", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    let countriesButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Countries", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    let applePayRoute: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Apple Pay Screen", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    var tableViewContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCountries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        enableNotifications()
    }
    
    @objc func tableViewButtonTapped() {
        navigationController?.pushViewController(DemoTableViewVC(), animated: true)
    }
    
    @objc func countriesButtonTapped() {
        navigationController?.pushViewController(CountryVC(), animated: true)
    }
    
    @objc func applePayButtonTapped() {
        navigationController?.pushViewController(ApplePayVC(), animated: true)
    }
}

// MARK: -UI Elements
extension HomeVC {
    private func setupUI() {
        title = "Home"
        
        view.backgroundColor = .secondarySystemBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .green
        
        view.addSubview(tableViewButton)
        NSLayoutConstraint.activate([
            tableViewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            tableViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            tableViewButton.widthAnchor.constraint(equalToConstant: 60),
            tableViewButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(countriesButton)
        NSLayoutConstraint.activate([
            countriesButton.topAnchor.constraint(equalTo: tableViewButton.bottomAnchor, constant: 30),
            countriesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countriesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            countriesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            countriesButton.widthAnchor.constraint(equalToConstant: 60),
            countriesButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(applePayRoute)
        NSLayoutConstraint.activate([
            applePayRoute.topAnchor.constraint(equalTo: countriesButton.bottomAnchor, constant: 30),
            applePayRoute.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            applePayRoute.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            applePayRoute.widthAnchor.constraint(equalToConstant: 60),
            applePayRoute.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        tableViewButton.addTarget(self,  action: #selector(tableViewButtonTapped), for: .touchUpInside)
        countriesButton.addTarget(self, action: #selector(countriesButtonTapped), for: .touchUpInside)
        applePayRoute.addTarget(self, action: #selector(applePayButtonTapped), for: .touchUpInside)
    }
    
    private func enableNotifications() {
        // 1. Ask for permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        
        // 2. Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Formula 1"
        content.body = "Mercedes AMG Petronas F1 team has won Constructors championship!"
        
        
        // 3. Create the notification trigger
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // 4. Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // 5. Register the request
        center.add(request) { (error) in
            print(error?.localizedDescription)
        }
    }
}

// MARK: -API Call Methods
extension HomeVC {
    private func getCountries() {
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
