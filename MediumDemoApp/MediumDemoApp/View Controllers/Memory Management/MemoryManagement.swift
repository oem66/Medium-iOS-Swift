//
//  MemoryManagement.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 4/14/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit

class MemoryManagementVC: UIViewController {
    
    var jon: PersonMM?
    var mac: MacBookMM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObject()
        assignProperties()
    }
    
    func createObject() {
        jon = PersonMM(name: "Jon", macBook: nil)
        mac = MacBookMM(name: "iMac", owner: nil)
    }
    
    func assignProperties() {
        jon?.macBook = mac
        mac?.owner = jon
        
        jon = nil
        print("Mac owner is \(mac?.owner)")
        mac = nil
    }
}
