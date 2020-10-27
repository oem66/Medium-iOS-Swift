//
//  CountryCell.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 10/26/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit
import SnapKit

class CountryCell: UITableViewCell {
    
    var cellCountryImage = UIImageView()
    var cellCountryTitle = UILabel()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellSetup() {
        self.backgroundColor = UIColor.tertiarySystemBackground
        
        addSubview(cellCountryImage)
        addSubview(cellCountryTitle)
        
        configureCellImage()
        configureLabel()
        setFlagImageConstraints()
        setCountryTitleConstraints()
    }
    
    func configureCell(flagImage: UIImage, countryTitle: String) {
        self.cellCountryImage.image = flagImage
        self.cellCountryTitle.text = countryTitle
    }
    
    private func configureCellImage() {
        self.cellCountryImage.layer.cornerRadius = 20.0
        cellCountryImage.clipsToBounds = true
    }
    
    private func configureLabel() {
        cellCountryTitle.textColor = .black
        cellCountryTitle.font = UIFont.boldSystemFont(ofSize: 15)
        cellCountryTitle.numberOfLines = 0
        cellCountryTitle.adjustsFontSizeToFitWidth = true
    }
    
    private func setFlagImageConstraints() {
        cellCountryImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellCountryImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellCountryImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cellCountryImage.heightAnchor.constraint(equalToConstant: 30),
            cellCountryImage.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setCountryTitleConstraints() {
        cellCountryTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellCountryTitle.leadingAnchor.constraint(equalTo: cellCountryImage.trailingAnchor, constant: 40),
            cellCountryTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellCountryTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
