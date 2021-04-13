//
//  DelegateSecVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 4/12/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit

let rbrNotificationKey = "co.omer.rbrSide"
let mercNotificationKey = "co.omer.mercSide"

class DelegateSecVC: ViewController {
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    var teamImage = UIImageView()
    
    var delegationModalScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show modal", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    let rbrF1 = Notification.Name(rawValue: rbrNotificationKey)
    let mercF1 = Notification.Name(rawValue: mercNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createObservers()
    }
    
    func createObservers() {
        // RedBull Racing
        NotificationCenter.default.addObserver(self, selector: #selector(DelegateSecVC.updateScreenImage(notification:)), name: rbrF1, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DelegateSecVC.updateNameLabel(notification:)), name: rbrF1, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DelegateSecVC.updateBackgroundImage(notification:)), name: rbrF1, object: nil)
        
        // Mercedes AMG F1
        NotificationCenter.default.addObserver(self, selector: #selector(DelegateSecVC.updateScreenImage(notification:)), name: mercF1, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DelegateSecVC.updateNameLabel(notification:)), name: mercF1, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DelegateSecVC.updateBackgroundImage(notification:)), name: mercF1, object: nil)
    }
    
    @objc func updateScreenImage(notification: NSNotification) {
        let isRbr = notification.name == rbrF1
        let image = isRbr ? UIImage(named: "rbr")! : UIImage(named: "mercedesf1")!
        teamImage.image = image
        debugPrint("updateScreenImage invoked for key: \(notification.name)!")
    }
    
    @objc func updateNameLabel(notification: NSNotification) {
        let isRbr = notification.name == rbrF1
        let teamName = isRbr ? "RedBull Racing" : "Mercedes AMG F1"
        textLabel.text = teamName
        debugPrint("updateNameLabel invoked for key: \(notification.name)!")
    }
    
    @objc func updateBackgroundImage(notification: NSNotification) {
        let isRbr = notification.name == rbrF1
        let color = isRbr ? UIColor.blue : UIColor.cyan
        view.backgroundColor = color
        debugPrint("updateBackgroundImage invoked for key: \(notification.name)!")
    }
    
    private func setupUI() {
        view.backgroundColor = .red
        title = "Delegation"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(textLabel)
        view.addSubview(teamImage)
        view.addSubview(delegationModalScreenButton)
        
        teamImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            teamImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            teamImage.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            teamImage.widthAnchor.constraint(equalToConstant: 200),
            teamImage.heightAnchor.constraint(equalToConstant: 100),
            
            delegationModalScreenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            delegationModalScreenButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            delegationModalScreenButton.topAnchor.constraint(equalTo: teamImage.bottomAnchor, constant: 40),
            delegationModalScreenButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        delegationModalScreenButton.addTarget(self, action: #selector(openModalDelegationScreen), for: .touchUpInside)
    }
    
    @objc func openModalDelegationScreen() {
        let vc = ModalDelegationVC()
//        vc.selectionDelegate = self
        navigationController?.present(vc, animated: true, completion: nil)
    }
}

//extension DelegateSecVC: SideSelectionDelegate {
//    func didTapChoice(text: String?, color: UIColor?, image: String?) {
//        if let Text = text,
//           let Color = color,
//           let Image = image {
//            textLabel.text = Text
//            view.backgroundColor = Color
//            teamImage.image = UIImage(named: Image)
//        }
//    }
//
//    func didTapChoice(text: String, color: UIColor, image: String) {
//        textLabel.text = "\(text)"
//        view.backgroundColor = color
//        teamImage.image = UIImage(named: image)
//    }
//}
