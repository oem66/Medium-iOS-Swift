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
    
    private var filteredEarthquakes = [EarthquakeDetails]()
    lazy var searchController: UISearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupTableView()
        fetchData()
        initSearchBar()
        print(earthquakesDay)
    }
    
    private func initSearchBar() {
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
//        searchController.searchBar.scopeButtonTitles = ["Day", "Week", "Month"]
        searchController.searchBar.delegate = self
    }
    
    private func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "Day") {
        filteredEarthquakes = earthquakesDay.features?.filter({ earthquake in
            if (searchController.searchBar.text != "") {
                let searchTextMatch = earthquake.properties?.place?.lowercased().contains(searchText.lowercased())
                return searchTextMatch!
            }
            return false
        }) ?? [EarthquakeDetails]()
        
        tableView.reloadData()
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
        earthquakesDaySubscriber = Webservice.shared.earthquakesDayPublisher.sink(receiveCompletion: { _ in }, receiveValue: { (earthquakes) in
            self.earthquakesDay = earthquakes
        })
    }
    
    private func pushViewController(earthquakeDetails: EarthquakeDetails) {
        let earthquakeDetailsVC = EarthquakeDetailsVC()
        earthquakeDetailsVC.earthquakeDetails = earthquakeDetails
        navigationController?.pushViewController(earthquakeDetailsVC, animated: true)
    }
}

extension EarthquakeDayVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive {
            return filteredEarthquakes.count
        }
        
        if let numberOfRows = earthquakesDay.features?.count {
            print("Number of rows for daily earthquakes is -> \(numberOfRows)")
            return numberOfRows
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "earthquakeCell") as? EarthquakesCell else { return UITableViewCell() }
        
        if searchController.isActive {
            if let title = filteredEarthquakes[indexPath.item].properties?.title,
               let magnitude = filteredEarthquakes[indexPath.item].properties?.mag {
                cell.configureCell(title: title, magnitude: magnitude)
            } else {
                cell.configureCell(title: "None", magnitude: 0)
            }
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            return cell
        }
        
        if let title = earthquakesDay.features?[indexPath.item].properties?.title,
           let magnitude = earthquakesDay.features?[indexPath.item].properties?.mag {
            cell.configureCell(title: title, magnitude: Double(magnitude))
        } else { cell.configureCell(title: "None", magnitude: 0) }
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pushViewController(earthquakeDetails: earthquakesDay.features![indexPath.row])
    }
}

// SearchBar delegate methods
extension EarthquakeDayVC: UISearchResultsUpdating, UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debugPrint("Search text: \(searchText)")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText)
    }
}
