//
//  DemoTableViewVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 5/20/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit

class DemoTableViewVC: UIViewController {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        setupUI()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = .black
    }
}

extension DemoTableViewVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell") as? DemoCell else { return UITableViewCell() }
        let image = UIImage(named: "demoImg")!
        cell.configureCell(image: image, title: "Test", description: "This is random text")
        return cell
    }
}

// MARK: - Table View constraints
extension DemoTableViewVC {
    func setupUI() {
        title = "Mostar"
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Configure cell
extension DemoTableViewVC {
    func configureTableView() {
        setTableViewDelegates()
        tableView.backgroundColor = .black
        tableView.rowHeight = 80.0
        tableView.register(DemoCell.self, forCellReuseIdentifier: "demoCell")
        tableView.separatorStyle = .none
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
