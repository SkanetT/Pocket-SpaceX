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
    @IBOutlet weak var statusTimerLabel: UILabel!
    var time = 0
    var isTime = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        isTime = false
    }
    
    func setData(_ data: LaunchDatum) {
        if let url = data.links.patch.small {
            patchImage.setKfImage(urlString: url)
        }
        nameLabel.text = data.name
        dateLabel.text = DataManager.makeDateStringFromUnixTime(data.dateUnix)
        
        if data.upcoming == false {
            if data.failures.isEmpty {
                statusTimerLabel.textColor = .green
                statusTimerLabel.text = "Success"
            } else {
                statusTimerLabel.textColor = .red
                statusTimerLabel.text = "Failure"
            }
        } else {
            statusTimerLabel.textColor = .black
            time = data.dateUnix
            isTime = true
            statusTimerLabel.text = DataManager.makeDateForTimer(time)
            let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(upTimer), userInfo: nil, repeats: true)
        }
    }
    
    @objc
    func upTimer() {
        if isTime {
            time -= 1
            statusTimerLabel.text = DataManager.makeDateForTimer(time)
//            DispatchQueue.main.async {
//                self.statusTimerLabel.text = DataManager.makeDateForTimer(self.time)
//            }
        }
    }
    
}
