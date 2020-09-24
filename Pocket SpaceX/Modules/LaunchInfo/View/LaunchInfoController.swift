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
    @IBOutlet weak var statusTimerLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var patchImage: UIImageView!
    var time = 0
    private let queue = DispatchQueue.init(label: "com.spacex.timer", qos: .background)
    weak var timer: Timer?
    
    var presenter: LaunchInfoPresenterInput?
    var youtubeHandler: LaunchInfoYoutubeHandlerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        youtubeHandler?.attach(youtubeView)
        presenter?.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    @objc
    private func handleEvent() {
        presenter?.addEventTap()
    }
    @objc
    private func upTimer() {
        queue.async {
            let text = DataManager.makeDateForTimer(self.time)
            DispatchQueue.main.async {
                self.statusTimerLabel.text = text
            }
        }
    }
    
    
    
}

extension LaunchInfoController: LaunchInfoPresenterOutput {
    func didReceiveLaunchInfoData(_ data: LaunchDatum) {
        title = data.name
        
        
        if let id = data.links.youtubeID {
            youtubeHandler?.setData(id)
        }
        if data.upcoming {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "calendar.badge.plus"), style: .plain, target: self, action: #selector(handleEvent))
            navigationItem.rightBarButtonItem?.tintColor = .black
            statusTimerLabel.textColor = .black
            time = data.dateUnix
            statusTimerLabel.text = DataManager.makeDateForTimer(time)
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
            patchImage.isHidden = true
        }
        
    }
    
}
