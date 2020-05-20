//
//  DemoCell.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 5/20/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit

class DemoCell: UITableViewCell {
    
    var cellImage = UIImageView()
    var cellTitle = UILabel()
    var cellDescription = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .black
        
        addSubview(cellImage)
        addSubview(cellTitle)
        addSubview(cellDescription)
        
        configureCellImage()
        configureLabels()
        
        setImageConstraints()
        setLabelsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DemoCell {
    func configureCell(image: UIImage, title: String, description: String) {
        self.cellImage.image = image
        self.cellTitle.text = title
        self.cellDescription.text = description
    }
    
    func configureCellImage() {
        cellImage.layer.cornerRadius = 10.0
        cellImage.clipsToBounds = true
    }
    
    func configureLabels() {
        cellTitle.textColor = .white
        cellDescription.textColor = .white
        
        cellTitle.font = UIFont.boldSystemFont(ofSize: 15)
        cellDescription.font = UIFont.systemFont(ofSize: 11)
        
        cellTitle.numberOfLines = 0
        cellDescription.numberOfLines = 0
        
        cellTitle.adjustsFontSizeToFitWidth = true
        cellDescription.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellImage.heightAnchor.constraint(equalToConstant: 60.0),
            cellImage.widthAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    func setLabelsConstraints() {
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cellTitle.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            cellDescription.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 3),
            cellDescription.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 15)
        ])
    }
}
