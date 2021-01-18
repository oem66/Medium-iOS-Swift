//
//  ViewController.swift
//  CombineNetworkingUsers
//
//  Created by Omer Rahmanovic on 1/18/21.
//

import UIKit
import Combine

struct User: Decodable {
    let name: String
    let company: Company
}

struct Company: Decodable {
    let name: String
}

class DataManager {
    
    private let urlString = "https://jsonplaceholder.typicode.com/users"
    
    var usersPublisher: AnyPublisher<[User], Error> {
        let url = URL(string: urlString)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

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
        title = "Users"
        tableView.tableFooterView = UIView()
    }
    
    private func fetchUsers() {
        usersSubscriber = DataManager().usersPublisher.sink(receiveCompletion: { _ in }, receiveValue: { (users) in
            self.users = users
        })
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
