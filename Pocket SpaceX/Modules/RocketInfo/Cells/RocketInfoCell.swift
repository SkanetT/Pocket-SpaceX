//
//  RocketInfoCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 12.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

final class RocketInfoCell: UITableViewCell {
    
    @IBOutlet weak var nameOptionLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
