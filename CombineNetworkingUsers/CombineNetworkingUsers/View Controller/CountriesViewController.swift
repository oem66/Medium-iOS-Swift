//
//  CountriesViewController.swift
//  CombineNetworkingUsers
//
//  Created by Omer Rahmanovic on 1/19/21.
//

import UIKit
import Combine

class CountriesViewController: UITableViewController {
    
    private var countriesSubscriber: AnyCancellable?
    private var countries = [Country]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
    }
    
    private func setupTableView() {
        navigationItem.title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.tableFooterView = UIView()
    }
    
    private func fetchData() {
        countriesSubscriber = DataManager().countriesPublisher.sink(receiveCompletion: { _ in },
            receiveValue: { (countries) in
                self.countries = countries
        })
    }
}

extension CountriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil) as UITableViewCell? else { return UITableViewCell() }
        let country = self.countries[indexPath.item]
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = country.capital
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
