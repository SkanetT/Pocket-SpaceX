//
//  RocketCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 10.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit


final class RocketCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var rocketImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rocketImage.clipsToBounds = true
        rocketImage.layer.cornerRadius = 12
        rocketImage.layer.borderColor = UIColor.black.cgColor
        rocketImage.layer.borderWidth = 0.1
        
        nameLabel.font = UIFont(name: "TimesNewRomanPSMT", size: UIScreen.main.bounds.width / 20)
        activeLabel.font = UIFont(name: "TimesNewRomanPSMT", size: UIScreen.main.bounds.width / 22)
        
    }
    
    func setData(_ data: RocketDatum) {
        nameLabel.text = data.name
        if data.active {
            activeLabel.textColor = Colors.green
            activeLabel.text = "Active"
        } else {
            activeLabel.textColor = Colors.red
            activeLabel.text = "Not active"
        }
        
        if let urlStr = data.flickrImages.first {
            rocketImage.setKfImage(urlString: urlStr)
        }
    }

}
