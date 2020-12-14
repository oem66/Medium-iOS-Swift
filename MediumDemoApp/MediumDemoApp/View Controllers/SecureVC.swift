//
//  SecureVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 11/5/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit
import LocalAuthentication

class SecureVC: UIViewController {
    
    var textContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.text = "Apple Inc."
        
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font.withSize(14)
        label.textColor = .gray
        label.text = "Is American based company."
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(hideSecretContent), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    private func setupUI() {
        title = "Secure"
        
        view.backgroundColor = .yellow
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .systemPink
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Authorize", style: .plain, target: self, action: #selector(authorizeTapped))
        
        view.addSubview(textContainer)
        NSLayoutConstraint.activate([
            textContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            textContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20)
        ])
        
        textContainer.addSubview(fullNameLabel)
        textContainer.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: textContainer.topAnchor, constant: 5),
            fullNameLabel.leadingAnchor.constraint(equalTo: textContainer.leadingAnchor, constant: 5),
            fullNameLabel.trailingAnchor.constraint(equalTo: textContainer.trailingAnchor, constant: 5),
            
            descriptionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: textContainer.leadingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: textContainer.trailingAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: textContainer.bottomAnchor, constant: 5)
        ])
    }
    
    private func unlockSecretContent() {
//        fullNameLabel.isHidden = false
//        descriptionLabel.isHidden = false
        
        textContainer.isHidden = false
        
        title = "Secure"
        
        fullNameLabel.text = KeychainWrapper.standard.string(forKey: "SecretFullName") ?? "No name"
        descriptionLabel.text = KeychainWrapper.standard.string(forKey: "SecretDescription") ?? "No description"
    }
    
    @objc private func hideSecretContent() {
//        guard fullNameLabel.isHidden == false else { return }
//        guard descriptionLabel.isHidden == false else { return }
        
        guard textContainer.isHidden == false else { return }
        
        KeychainWrapper.standard.set(fullNameLabel, forKey: "SecretFullName")
        KeychainWrapper.standard.set(descriptionLabel, forKey: "SecretDescription")
        
//        fullNameLabel.resignFirstResponder()
//        descriptionLabel.resignFirstResponder()
        
        textContainer.resignFirstResponder()
        
//        fullNameLabel.isHidden = true
//        descriptionLabel.isHidden = true
        
        textContainer.isHidden = true
        
        title = "Unauthorized access"
    }
    
    @objc private func authorizeTapped() {
        let context = LAContext()
        var error = Error.self
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self?.unlockSecretContent()
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self?.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Authentication failed", message: "Your device is not configured for biometric authentication", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
}
