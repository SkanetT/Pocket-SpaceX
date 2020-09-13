//
//  LaunchCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchCell: UITableViewCell {
    
    @IBOutlet weak var patchImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setData(_ data: LaunchDatum) {
        if let url = data.links.patch.small {
            patchImage.setKfImage(urlString: url)
        }
        nameLabel.text = data.name
        dateLabel.text = data.dateUnix.makeDate()
    }
    
}
