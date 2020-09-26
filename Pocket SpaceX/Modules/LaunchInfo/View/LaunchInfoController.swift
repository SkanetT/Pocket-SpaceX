//
//  LaunchInfoController.swift
//  Pocket SpaceX
//
//  Created by Антон on 15.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class LaunchInfoController: UIViewController {
    
    @IBOutlet weak var youtubeView: YTPlayerView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusTimerLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var viewForPatch: UIView!
    @IBOutlet weak var patchImage: UIImageView!
    @IBOutlet weak var rocketStack: UIStackView!
    @IBOutlet weak var rocketName: UILabel!
    @IBOutlet weak var launchpadStack: UIStackView!
    @IBOutlet weak var launchpadName: UILabel!

    private let queue = DispatchQueue.init(label: "com.spacex.timer", qos: .background)
    weak var timer: Timer?
    
    var presenter: LaunchInfoPresenterInput?
    var youtubeHandler: LaunchInfoYoutubeHandlerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        youtubeHandler?.attach(youtubeView)
        presenter?.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        rocketStack.clipsToBounds = true
        rocketStack.layer.cornerRadius = 8
        rocketStack.alpha = 0.95
        
        launchpadStack.clipsToBounds = true
        launchpadStack.layer.cornerRadius = 8
        launchpadStack.alpha = 0.95
        
        statusTimerLabel.clipsToBounds = true
        statusTimerLabel.layer.cornerRadius = 8
        statusTimerLabel.alpha = 0.95
        
        detailsLabel.clipsToBounds = true
        detailsLabel.layer.cornerRadius = 8
        detailsLabel.alpha = 0.95
        
        let rocketGesture = UITapGestureRecognizer(target: self, action: #selector(rocketTap (_ :)))
        rocketStack.isUserInteractionEnabled = true
        rocketStack.addGestureRecognizer(rocketGesture)
    }
    
    @objc
    private func handleEvent() {
        presenter?.addEventTap()
    }
    @objc
    private func upTimer() {
        queue.async {
            self.presenter?.timerTick()
        }
    }
    
    @objc
    private func rocketTap(_ sender: UITapGestureRecognizer ) {
        presenter?.rocketTap()
    }
    
}

extension LaunchInfoController: LaunchInfoPresenterOutput {
    func didReceiveLaunchInfoData(_ data: LaunchDatum) {
        title = data.name
        
        
        if let id = data.links.youtubeID {
            youtubeHandler?.setData(id)
        }
        
        dateLabel.text = DataManager.makeDateStringFromUnixTime(data.dateUnix)
        
        if data.upcoming {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "calendar.badge.plus"), style: .plain, target: self, action: #selector(handleEvent))
            statusTimerLabel.textColor = .black
            statusTimerLabel.text = DataManager.makeDateForTimer(data.dateUnix)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.upTimer), userInfo: nil, repeats: true)
        } else {
            if data.failures.isEmpty {
                statusTimerLabel.textColor = .green
                statusTimerLabel.text = "Success"
            } else {
                statusTimerLabel.textColor = .red
                statusTimerLabel.text = "Failure"
            }
        }
        
        if let details = data.details {
            detailsLabel.text = details
        } else {
            detailsLabel.isHidden = true
        }
        
        if let patch = data.links.patch.large {
            patchImage.setKfImage(urlString: patch)
        } else {
            viewForPatch.isHidden = true
        }
        
    }
    
    func didReceiveNewTime(_ time: String) {
        DispatchQueue.main.async {
            self.statusTimerLabel.text = time
        }
    }
    
    func didReceiveRocketName(_ name: String) {
        DispatchQueue.main.async {
            self.rocketName.text = name
        }
    }
    
    func didReceiveLaunchpadName(_ name: String) {
        DispatchQueue.main.async {
            self.launchpadName.text = name
        }
    }
    
}
