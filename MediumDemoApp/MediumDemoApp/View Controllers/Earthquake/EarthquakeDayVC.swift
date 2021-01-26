//
//  EarthquakeDayVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 1/26/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit
import Combine

class EarthquakeDayVC: UITableViewController {
    
    private var earthquakesDaySubscriber: AnyCancellable?
    private var earthquakesDay = Earthquake() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupTableView()
        fetchData()
        print(earthquakesDay)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Earthquakes today"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 60.0
        tableView.register(EarthquakesCell.self, forCellReuseIdentifier: "earthquakeCell")
    }
    
    private func fetchData() {
        earthquakesDaySubscriber = Webservice().earthquakesDayPublisher.sink(receiveCompletion: { _ in }, receiveValue: { (earthquakes) in
            self.earthquakesDay = earthquakes
        })
    }
}

extension EarthquakeDayVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRows = earthquakesDay.features?.count {
            print("Number of rows for daily earthquakes is -> \(numberOfRows)")
            return numberOfRows
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "earthquakeCell") as? EarthquakesCell else { return UITableViewCell() }
        if let title = earthquakesDay.features?[indexPath.item].properties?.title,
           let magnitude = earthquakesDay.features?[indexPath.item].properties?.mag {
            cell.configureCell(title: title, magnitude: Int(magnitude))
        } else { cell.configureCell(title: "None", magnitude: 0) }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
