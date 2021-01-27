//
//  EarthquakesCell.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 1/26/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit

class EarthquakesCell: UITableViewCell {
    
    var cellEarthquakeTitle = UILabel()
    var cellEarthquakeMagnitude = UILabel()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellSetup() {
        addSubview(cellEarthquakeTitle)
        addSubview(cellEarthquakeMagnitude)
        
        cellEarthquakeTitle.translatesAutoresizingMaskIntoConstraints = false
        cellEarthquakeMagnitude.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = UIColor.tertiarySystemBackground
        
        cellEarthquakeTitle.adjustsFontSizeToFitWidth = true
        cellEarthquakeTitle.font = UIFont.boldSystemFont(ofSize: 16)
        cellEarthquakeTitle.textColor = .black
        cellEarthquakeTitle.numberOfLines = 0
        
        cellEarthquakeMagnitude.adjustsFontSizeToFitWidth = true
        cellEarthquakeMagnitude.font = UIFont.boldSystemFont(ofSize: 13)
        cellEarthquakeMagnitude.textColor = .orange
        cellEarthquakeMagnitude.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            cellEarthquakeTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellEarthquakeTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cellEarthquakeTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            cellEarthquakeMagnitude.topAnchor.constraint(equalTo: cellEarthquakeTitle.bottomAnchor, constant: 5),
            cellEarthquakeMagnitude.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cellEarthquakeMagnitude.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
    func configureCell(title: String, magnitude: Double) {
        self.cellEarthquakeTitle.text = title
        self.cellEarthquakeMagnitude.text = "\(magnitude)"
    }
}
