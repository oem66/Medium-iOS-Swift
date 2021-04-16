//
//  EarthquakeDetails.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 1/27/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit

class EarthquakeDetailsVC: UIViewController {
    
    var earthquakeDetails = EarthquakeDetails()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    var magnitudeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    var placeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    var tsunamiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemTeal
        
        view.addSubview(titleLabel)
        view.addSubview(magnitudeLabel)
        view.addSubview(placeLabel)
        view.addSubview(tsunamiLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            magnitudeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            magnitudeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            magnitudeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            placeLabel.topAnchor.constraint(equalTo: magnitudeLabel.bottomAnchor, constant: 20),
            placeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            placeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            tsunamiLabel.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 20),
            tsunamiLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tsunamiLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
        if let title = earthquakeDetails.properties?.title,
           let magnitude = earthquakeDetails.properties?.mag,
           let place = earthquakeDetails.properties?.place,
           let tsunami = earthquakeDetails.properties?.tsunami {
            titleLabel.text = title
            magnitudeLabel.text = "Magnitude: \(magnitude)"
            placeLabel.text = "Place: \(place)"
            tsunamiLabel.text = "Tsunami warning: \(tsunami)"
        }
    }
}
