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
    } ()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "TimesNewRomanPS-ItalicMT", size: 23)
        label.textAlignment = .left
        return label
        
    } ()
    
//    let descriptionView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.alpha = 0.5
//        view.clipsToBounds = true
//        view.layer.cornerRadius = 8
//        return view
//    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
//        addSubview(descriptionView)
//        descriptionView.snp.makeConstraints() { make in
//            make.centerY.equalTo(snp.centerY)
//            make.height.equalTo(44)
//            make.left.equalTo(snp.left).offset(8)
//            make.right.equalTo(UIScreen.main.bounds.width).offset(-88)
//        }
        
        addSubview(iconImageView)
        iconImageView.snp.makeConstraints() { make in
            make.centerY.equalTo(snp.centerY)
            make.left.equalTo(snp.left).offset(16)
            make.height.width.equalTo(36)
        }
        
        
        
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints() { make in
            make.centerY.equalTo(snp.centerY)
            make.left.equalTo(iconImageView.snp.right).offset(12)
            make.right.equalTo(UIScreen.main.bounds.width).offset(-96)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



