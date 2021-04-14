//
//  Memory.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 4/14/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import Foundation

class PersonMM {
    let name: String
    var macBook: MacBookMM?
    
    init(name: String, macBook: MacBookMM?) {
        self.name = name
        self.macBook = macBook
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class MacBookMM {
    let name: String
    weak var owner: PersonMM?
    
    init(name: String, owner: PersonMM?) {
        self.name = name
        self.owner = owner
    }
    
    deinit {
        print("MacBook named \(name) is being deinitialized")
    }
}
