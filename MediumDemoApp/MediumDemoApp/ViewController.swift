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

        
        // API Endpoint
        let urlString = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-03-21&sortBy=publishedAt&apiKey=e34d110f031548aba6695ce095348693"
        let url = URL(string: urlString)
        
        guard url != nil else {
            debugPrint("URL je nil")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            //check for errors
            if error == nil && data != nil {
                // parse JSON
                let decoder = JSONDecoder()
                
                do {
                    let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    print("RESPONSE -->> \(response)")
                    print("This is JSON result -->> \n\(newsFeed)")
                    
                } catch {
                    debugPrint("Error in JSON parsing!")
                }
            }
        }
        // Make the API Call
        dataTask.resume()
    }
}

