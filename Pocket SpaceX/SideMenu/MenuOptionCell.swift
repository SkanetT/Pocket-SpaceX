//
//  MenuOptionCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    
    let iconImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .black
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .lightGray
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



