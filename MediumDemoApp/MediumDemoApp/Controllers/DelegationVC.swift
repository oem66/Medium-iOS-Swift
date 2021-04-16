//
//  DelegationVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 12/14/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit

class BaseDelegationVC: ViewController {
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    var showModalButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show modal", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @objc func openModalScreen() {
        let vc = DelegationModalVC()
        vc.delegate = self
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    private func setupUI() {
        view.backgroundColor = .green
        
        view.addSubview(textLabel)
        view.addSubview(showModalButton)
        
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            showModalButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            showModalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            showModalButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 30)
        ])
        
        showModalButton.addTarget(self, action: #selector(openModalScreen), for: .touchUpInside)
    }
}

extension BaseDelegationVC: ModalViewControllerDelegate {
    func changeTextFromDelegate(_ viewController: DelegationModalVC, didUpdateText text: String) {
        print("Nothing")
    }
    
    func modalViewController(_ viewController: DelegationModalVC, didUpdateText text: String) {
        textLabel.text = text
    }
}
