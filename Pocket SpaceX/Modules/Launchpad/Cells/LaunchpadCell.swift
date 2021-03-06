//
//  LaunchpadCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

final class LaunchpadCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let backgroundView = UIView()
        backgroundView.backgroundColor = Colors.lowBlue
        selectedBackgroundView = backgroundView
    }
    
    func setData(_ data: LaunchpadDatum) {
        nameLabel.text = data.name
        statusLabel.text = data.status.capitalized
    }
}
