//
//  RocketCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 10.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import Kingfisher


class RocketCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var rocketImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rocketImage.clipsToBounds = true
        rocketImage.layer.cornerRadius = 8
        rocketImage.layer.borderColor = UIColor.black.cgColor
        rocketImage.layer.borderWidth = 0.4
        
    }
    
    func setData(_ data: RocketDatum) {
        nameLabel.text = data.name
        if data.active {
            activeLabel.textColor = .green
            activeLabel.text = "Active"
        } else {
            activeLabel.textColor = .red
            activeLabel.text = "Not active"
        }
        
        if let urlStr = data.flickrImages.first, let url = URL(string: urlStr) {
            rocketImage.kf.indicatorType = .activity
            rocketImage.kf.setImage(with: url)
        }
    }

}
