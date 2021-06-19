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
import AuthenticationServices

class HomeVC: UIViewController, Storyboarded {
    
    weak var coordinator: AppCoordinator?
    
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
    
    let signInWithApple: UIButton = {
        let button = UIButton(type: .system)
        
        return button
    }()
    
    let secureButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Authorized Personel", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    let delegationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delegation", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    let optionalsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Optionals", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    let earthquakesButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Earthquakes", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    let delegate2Button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delegate 2", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    let memoryManagementButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Retain Cycle", for: .normal)
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
        configureLoginButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        enableNotifications()
    }
    
    @objc func tableViewButtonTapped() {
//        navigationController?.pushViewController(DemoTableViewVC(), animated: true)
        navigationController?.pushViewController(CombineDemoVC(), animated: true)
    }
    
    @objc func countriesButtonTapped() {
        navigationController?.pushViewController(CountryVC(), animated: true)
    }
    
    @objc func applePayButtonTapped() {
        navigationController?.pushViewController(ApplePayVC(), animated: true)
    }
    
    @objc func tapLoginButton() {
        let appleIDDetails = ASAuthorizationAppleIDProvider()
        let request = appleIDDetails.createRequest()
        request.requestedScopes = [.email, .fullName]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }
    
    @objc func secureButtonTapped() {
        navigationController?.pushViewController(SecureVC(), animated: true)
    }
    
    @objc func delegationButtonTapped() {
        navigationController?.pushViewController(BaseDelegationVC(), animated: true)
    }
    
    @objc func optionalsButtonTapped() {
        navigationController?.pushViewController(OptionalsDemoVC(), animated: true)
    }
    
    @objc func earthquakesButtonTapped() {
        navigationController?.pushViewController(EarthquakesVC(), animated: true)
    }
    
    @objc func delegate2ButtonTapped() {
        navigationController?.pushViewController(DelegateSecVC(), animated: true)
    }
    
    @objc func memoryManagementButtonTapped() {
        navigationController?.pushViewController(MemoryManagementVC(), animated: true)
    }
}

// MARK: -UI Elements
extension HomeVC: ASAuthorizationControllerDelegate {
    private func setupUI() {
        title = "Home"
        
        view.backgroundColor = .yellow
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .systemPink
        
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
        
        view.addSubview(secureButton)
        NSLayoutConstraint.activate([
            secureButton.topAnchor.constraint(equalTo: applePayRoute.bottomAnchor, constant: 30),
            secureButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            secureButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            secureButton.widthAnchor.constraint(equalToConstant: 60),
            secureButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(delegationButton)
        NSLayoutConstraint.activate([
            delegationButton.topAnchor.constraint(equalTo: secureButton.bottomAnchor, constant: 30),
            delegationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            delegationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            delegationButton.widthAnchor.constraint(equalToConstant: 60),
            delegationButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(optionalsButton)
        NSLayoutConstraint.activate([
            optionalsButton.topAnchor.constraint(equalTo: delegationButton.bottomAnchor, constant: 30),
            optionalsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            optionalsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            optionalsButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(earthquakesButton)
        NSLayoutConstraint.activate([
            earthquakesButton.topAnchor.constraint(equalTo: optionalsButton.bottomAnchor, constant: 30),
            earthquakesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            earthquakesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            earthquakesButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(delegate2Button)
        NSLayoutConstraint.activate([
            delegate2Button.topAnchor.constraint(equalTo: earthquakesButton.bottomAnchor, constant: 30),
            delegate2Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            delegate2Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            delegate2Button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(memoryManagementButton)
        NSLayoutConstraint.activate([
            memoryManagementButton.topAnchor.constraint(equalTo: delegate2Button.bottomAnchor, constant: 30),
            memoryManagementButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            memoryManagementButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            memoryManagementButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        tableViewButton.addTarget(self,  action: #selector(tableViewButtonTapped), for: .touchUpInside)
        countriesButton.addTarget(self, action: #selector(countriesButtonTapped), for: .touchUpInside)
        applePayRoute.addTarget(self, action: #selector(applePayButtonTapped), for: .touchUpInside)
        secureButton.addTarget(self, action: #selector(secureButtonTapped), for: .touchUpInside)
        delegationButton.addTarget(self, action: #selector(delegationButtonTapped), for: .touchUpInside)
        optionalsButton.addTarget(self, action: #selector(optionalsButtonTapped), for: .touchUpInside)
        earthquakesButton.addTarget(self, action: #selector(earthquakesButtonTapped), for: .touchUpInside)
        delegate2Button.addTarget(self, action: #selector(delegate2ButtonTapped), for: .touchUpInside)
        memoryManagementButton.addTarget(self, action: #selector(memoryManagementButtonTapped), for: .touchUpInside)
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
    
    private func configureLoginButton() {
        let button = ASAuthorizationAppleIDButton()
        button.center = view.center
        button.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let details = authorization.credential as? ASAuthorizationAppleIDCredential {
            print(details.user)
            print(details.fullName!)
            print(details.email!)
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: -API Call Methods
extension HomeVC {
    private func getCountries() {
        Webservice.shared.getAllCountries { result in
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
