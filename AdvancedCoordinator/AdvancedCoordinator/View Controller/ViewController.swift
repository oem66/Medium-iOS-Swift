//
//  ViewController.swift
//  AdvancedCoordinator
//
//  Created by Omer Rahmanovic on 3/15/21.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
    
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBAction func authenticateTapped(_ sender: Any) {
        var username = usernameTxt.text ?? "none"
        var password = passwordTxt.text ?? "none"
        
        coordinator?.authenticate(username, password)
    }
    
}

