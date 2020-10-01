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
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusTimerLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var viewForPatch: UIView!
    @IBOutlet weak var patchImage: UIImageView!
    @IBOutlet weak var rocketStack: UIStackView!
    @IBOutlet weak var rocketName: UILabel!
    @IBOutlet weak var launchpadStack: UIStackView!
    @IBOutlet weak var launchpadName: UILabel!
    @IBOutlet weak var viewForButtons: UIView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var linksButton: UIButton!
    @IBOutlet weak var viewForFlickr: UIView! 
    
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
        
        viewForFlickr.isHidden = true
        
        rocketStack.clipsToBounds = true
        rocketStack.layer.cornerRadius = 8
        rocketStack.alpha = 0.95
        
        launchpadStack.clipsToBounds = true
        launchpadStack.layer.cornerRadius = 8
        launchpadStack.alpha = 0.95
        
        statusTimerLabel.clipsToBounds = true
        statusTimerLabel.layer.cornerRadius = 8
        statusTimerLabel.alpha = 0.95
        
        dateLabel.clipsToBounds = true
        dateLabel.layer.cornerRadius = 8
        dateLabel.alpha = 0.95
        
        detailsLabel.clipsToBounds = true
        detailsLabel.layer.cornerRadius = 8
        detailsLabel.alpha = 0.95
        
        shareButton.clipsToBounds = true
        shareButton.layer.cornerRadius = 8
        shareButton.alpha = 0.95
        shareButton.addTarget(self, action: #selector(shareTap), for: .touchUpInside)
        
        linksButton.clipsToBounds = true
        linksButton.layer.cornerRadius = 8
        linksButton.alpha = 0.95
        linksButton.addTarget(self, action: #selector(linksTap), for: .touchUpInside)
        
        let rocketGesture = UITapGestureRecognizer(target: self, action: #selector(rocketTap (_ :)))
        rocketStack.isUserInteractionEnabled = true
        rocketStack.addGestureRecognizer(rocketGesture)
        
        let launchpadGesture = UITapGestureRecognizer(target: self, action: #selector(launchpadTap (_ :)))
        launchpadStack.isUserInteractionEnabled = true
        launchpadStack.addGestureRecognizer(launchpadGesture)
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
    
    @objc
    private func launchpadTap(_ sender: UITapGestureRecognizer ) {
        presenter?.launchpadTap()
    }
    
    @objc
    private func shareTap() {
        presenter?.shareTap()
    }
    
    @objc
    private func linksTap() {
        presenter?.linksTap()
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
        
        if data.links.wikipedia == nil && data.links.reddit.campaign == nil && data.links.reddit.launch == nil && data.links.reddit.media == nil && data.links.reddit.recovery == nil {
            viewForButtons.isHidden = true
        }
        
        if data.links.flickr.original.count > 0 {
            DispatchQueue.main.async {
                self.viewForFlickr.isHidden = false
                let flickrView = FlickrView()
                self.viewForFlickr.addSubview(flickrView)
                flickrView.snp.makeConstraints() { make in
                    make.top.equalTo(self.viewForFlickr.snp.top)
                    make.leading.equalTo(self.viewForFlickr.snp.leading)
                    make.trailing.equalTo(self.viewForFlickr.snp.trailing)
                    make.bottom.equalTo(self.viewForFlickr.snp.bottom)
                }
                flickrView.setData(data.links.flickr.original)
            }
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
