//
//  APIService.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 6/9/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit
import Combine

class APICaller {
    static let shared = APICaller()
    
    func fetchCompanies() -> Future<[String], Error> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                promise(.success(["Apple", "Microsoft", "TMobile", "Oracle"]))
            })
        }
    }
}
