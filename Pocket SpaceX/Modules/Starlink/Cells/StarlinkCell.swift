//
//  StarlinkCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

final class StarlinkCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var verLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setData(_ data: StarlinkDatum) {
        nameLabel.text = data.spaceTrack.objectName
        verLabel.text = data.version
        dateLabel.text = data.spaceTrack.launchDate
        if let height = data.heightKM {
            statusLabel.textColor = Colors.green
            statusLabel.text = "Active"
            heightLabel.textColor = .black
            heightLabel.text = (round(100 * height) / 100).description
        } else {
            statusLabel.textColor = Colors.red
            statusLabel.text = "Not active"
            heightLabel.textColor = Colors.red
            heightLabel.text = "None"
        }
    }
}
