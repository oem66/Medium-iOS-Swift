//
//  CountryVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 10/26/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit
import SDWebImage

class CountryVC: UIViewController {
    
    var tableView = UITableView()
    var countries = [Country]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var europeCountries = [Country]()
    var northAmericaCountries = [Country]()
    var southAmericaCountries = [Country]()
    var asiaCountries = [Country]()
    var australiaOceaniaCountries = [Country]()
    var africaCountries = [Country]()
    var antarticaCountries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        getData()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        view.backgroundColor = .gray
        title = "Countries"
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .green
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        configureTableView()
    }
    
    private func configureTableView() {
        setTableViewDelegates()
        tableView.backgroundColor = .white
        tableView.rowHeight = 50.0
        tableView.register(CountryCell.self, forCellReuseIdentifier: "countryCell")
        tableView.separatorStyle = .none
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func countrySort() {
        DispatchQueue.main.async {
            self.countries.forEach { country in
                if country.region == "Europe" {
                    self.europeCountries.append(country)
                } else if country.region == "Asia" {
                    self.asiaCountries.append(country)
                } else if country.region == "Oceania" {
                    self.australiaOceaniaCountries.append(country)
                } else if country.subregion == "Northern America" {
                    self.northAmericaCountries.append(country)
                } else if country.subregion == "South America" {
                    self.southAmericaCountries.append(country)
                } else if country.region == "Africa" {
                    self.africaCountries.append(country)
                } else if country.region == "Polar" {
                    self.antarticaCountries.append(country)
                }
            }
        }
    }
}

extension CountryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as? CountryCell else { return UITableViewCell() }
        cell.imageView?.sd_setImage(with: URL(string: (countries[indexPath.row].flag ?? "demoImg")), placeholderImage: UIImage(named: "demoImg"))
        cell.cellCountryTitle.text = countries[indexPath.row].name
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pushViewController(country: countries[indexPath.row])
    }
    
}

// MARK: - Network Call
extension CountryVC {
    private func getData() {
        Webservice().getAllCountries { result in
            switch result {
            case .success(let countries):
                DispatchQueue.main.async {
                    self.countries = countries
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
//        countrySort()
//        print("Europe -> \(europeCountries.count)")
//        print("North America -> \(northAmericaCountries.count)")
//        print("South America -> \(southAmericaCountries.count)")
//        print("Asia -> \(asiaCountries.count)")
//        print("Africa -> \(africaCountries.count)")
//        print("Oceania -> \(australiaOceaniaCountries.count)")
//        print("Polar -> \(antarticaCountries.count)")
        self.tableView.reloadData()
    }
    
    private func pushViewController(country: Country) {
         let countryDetailVC = CountryDetailVC()
        
        countryDetailVC.country.name = country.name
        countryDetailVC.country.alpha3Code = country.alpha3Code
        countryDetailVC.country.capital = country.capital
        countryDetailVC.country.region = country.region
        countryDetailVC.country.subregion = country.subregion
        countryDetailVC.country.population = country.population
        countryDetailVC.country.latlng = country.latlng
        countryDetailVC.country.borders = country.borders
        countryDetailVC.country.flag = country.flag
        
        navigationController?.pushViewController(countryDetailVC, animated: true)
    }
}
