//
//  ViewController.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 4/21/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
        // API Endpoint Finance
        let urlString = "https://prime.exchangerate-api.com/v5/2afde83ec6828e27f28e2b7a/latest/USD"
        let url = URL(string: urlString)
        
        guard url != nil else {
            debugPrint("URL is nil")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                
                do {
                    let conversion = try decoder.decode(CurrencyRate.self, from: data!)
                    print("This is JSON result -->> \n\(conversion)")
                } catch {
                    debugPrint("Error in JSON parsing!")
                }
            }
        }
        dataTask.resume()
    }
}
