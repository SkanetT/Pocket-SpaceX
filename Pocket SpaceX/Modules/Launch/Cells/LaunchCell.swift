//
//  LaunchCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit


final class LaunchCell: UITableViewCell {
    
    @IBOutlet weak var patchImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusTimerLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    var time = 0
    weak var timer: Timer?
    private let queue = DispatchQueue.init(label: "com.spacex.timer", qos: .background)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .default
        let backgroundView = UIView()
        backgroundView.backgroundColor = Colors.lowBlue
        selectedBackgroundView = backgroundView
        backView.setRounding()
        backView.setShadow(color: .black)
        backView.backgroundColor = Colors.lowGray
        patchImage.setShadow(color: .black)
        
    }
    
    override func prepareForReuse() {
        timer?.invalidate()
        patchImage.cancelDownload()
    }
    
    func setData(_ data: LaunchDatum) {
        
        if let url = data.links.patch.small {
            patchImage.setKfImage(urlString: url)
        } else {
            patchImage.setKfImage(urlString: "")
        }
        nameLabel.text = data.name
        dateLabel.text = DataManager.makeDateStringFromUnixTime(data.dateUnix)
        
        if data.upcoming == false {
            statusTimerLabel.font = statusTimerLabel.font.withSize(22)
            if data.failures.isEmpty {
                statusTimerLabel.textColor = Colors.green
                statusTimerLabel.text = "Success"
            } else {
                statusTimerLabel.textColor = Colors.red
                statusTimerLabel.text = "Failure"
            }
        } else {
            statusTimerLabel.font = statusTimerLabel.font.withSize(18)
            statusTimerLabel.textColor = .black
            time = data.dateUnix
            statusTimerLabel.text = DataManager.makeDateForTimer(time)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.upTimer), userInfo: nil, repeats: true)
        }
    }
    
    @objc
    func upTimer() {
        queue.async {
            let text = DataManager.makeDateForTimer(self.time)
            DispatchQueue.main.async {
                self.statusTimerLabel.text = text
            }
        }
    }
}
