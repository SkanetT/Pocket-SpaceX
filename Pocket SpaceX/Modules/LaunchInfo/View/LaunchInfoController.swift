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
    
    var presenter: LaunchInfoPresenterInput?
    var youtubeHandler: LaunchInfoYoutubeHandlerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        youtubeHandler?.attach(youtubeView)
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
}

extension LaunchInfoController: LaunchInfoPresenterOutput {
    func didReceiveLaunchInfoData(_ data: LaunchDatum) {
        title = data.name
        if let id = data.links.youtubeID {
            youtubeView.load(withVideoId: id, playerVars: ["playsinline" : 1] )
            //         youtubeHandler?.setData(id)
        }
    }
    
}
