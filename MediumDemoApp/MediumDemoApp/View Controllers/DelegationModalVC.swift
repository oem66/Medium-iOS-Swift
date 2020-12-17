//
//  DelegationModalVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 12/14/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit

protocol ModalViewControllerDelegate: class {
    func modalViewController(_ viewController: DelegationModalVC, didUpdateText text: String)
}

class DelegationModalVC: UIViewController {
    
    weak var delegate: ModalViewControllerDelegate?
    
    var textField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "John"
        field.placeholderColor(UIColor.gray)
        field.autocorrectionType = .no
        field.spellCheckingType = .no
        field.keyboardAppearance = .default
        field.keyboardType = .default
        field.textColor = .black
        
        return field
    }()
    
    var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
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
    
    @objc func doneButtonTapped() {
        guard let text = textField.text else { return }
        delegate?.modalViewController(self, didUpdateText: text)
        dismiss(animated: true, completion: nil)
    }
    
    private func setupUI() {
        view.addSubview(textField)
        view.addSubview(doneButton)
        
        view.backgroundColor = UIColor.red
        
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            doneButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
    }
}
