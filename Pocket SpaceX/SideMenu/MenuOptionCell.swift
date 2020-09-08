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
        iconImageView.snp.makeConstraints() { make in
            make.centerY.equalTo(snp.centerY)
            make.left.equalTo(snp.left).offset(12)
            make.height.width.equalTo(28)
        }
        
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints() { make in
            make.centerY.equalTo(snp.centerY)
            make.left.equalTo(iconImageView.snp.right).offset(12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



