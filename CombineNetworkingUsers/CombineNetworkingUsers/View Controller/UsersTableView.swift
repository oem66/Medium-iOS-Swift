//
//  ViewController.swift
//  CombineNetworkingUsers
//
//  Created by Omer Rahmanovic on 1/18/21.
//

import UIKit
import Combine

class UsersTableViewController: UITableViewController {
    
    private var usersSubscriber: AnyCancellable?
    private var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchUsers()
    }
    
    private func setupTableView() {
        navigationItem.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Countries", style: .plain, target: self, action: #selector(countriesButtonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(settingsTapped))
        tableView.tableFooterView = UIView()
    }
    
    private func fetchUsers() {
        usersSubscriber = DataManager().usersPublisher.sink(receiveCompletion: { _ in }, receiveValue: { (users) in
            self.users = users
        })
    }
    
    @objc func countriesButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let countriesVC = storyboard.instantiateViewController(withIdentifier: "CountriesViewController")
        self.navigationController?.pushViewController(countriesVC, animated: true)
    }
    
    @objc func settingsTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let settingsVC = storyboard.instantiateViewController(withIdentifier: "SettingsViewController")
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }

}

extension UsersTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil) as UITableViewCell? else { return UITableViewCell() }
        let user = self.users[indexPath.item]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.company.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
