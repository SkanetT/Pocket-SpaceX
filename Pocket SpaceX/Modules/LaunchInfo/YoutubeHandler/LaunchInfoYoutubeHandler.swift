//
//  LaunchInfoYoutubeHandler.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class LaunchInfoYoutubeHandler: NSObject, LaunchInfoYoutubeHandlerProtocol {
    
    private weak var youtubeView: YTPlayerView?
    
    func attach(_ youtubeView: YTPlayerView) {
        self.youtubeView = youtubeView
        youtubeView.delegate = self
    }
    
    func setData(_ id: String) {
        youtubeView?.load(withVideoId: id, playerVars: ["playsinline" : 1] )
    }
    
}

extension LaunchInfoYoutubeHandler: YTPlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        let status = UserDefaultsManager.shared.fetchVideoStatus()
        if status == true {
            playerView.playVideo()
        }
    }
    
}
