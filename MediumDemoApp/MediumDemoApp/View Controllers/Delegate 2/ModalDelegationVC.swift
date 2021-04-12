//
//  ModalDelegationVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 4/12/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit

protocol SideSelectionDelegate {
    func didTapChoice(text: String?, color: UIColor?, image: String?)
}

class ModalDelegationVC: UIViewController {
    
    var selectionDelegate: SideSelectionDelegate!
    
    var redbullRacingButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RedBull Racing", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    var mercedesAMGButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Mercedes AMG F1", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.cyan, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .orange
        title = "Modal Delegation"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(redbullRacingButton)
        view.addSubview(mercedesAMGButton)
        
        NSLayoutConstraint.activate([
            redbullRacingButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redbullRacingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redbullRacingButton.heightAnchor.constraint(equalToConstant: 40),
            
            mercedesAMGButton.topAnchor.constraint(equalTo: redbullRacingButton.bottomAnchor, constant: 30),
            mercedesAMGButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mercedesAMGButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        redbullRacingButton.addTarget(self, action: #selector(redbullRacingButtonTapped), for: .touchUpInside)
        mercedesAMGButton.addTarget(self, action: #selector(mercedesAMGButtonTapped), for: .touchUpInside)
    }
    
    @objc func redbullRacingButtonTapped() {
        selectionDelegate.didTapChoice(text: "RedBull Racing", color: .blue, image: "rbr")
        dismiss(animated: true, completion: nil)
    }
    
    @objc func mercedesAMGButtonTapped() {
        selectionDelegate.didTapChoice(text: "Mercedes AMG F1", color: .cyan, image: "mercedesf1")
        dismiss(animated: true, completion: nil)
    }
}
