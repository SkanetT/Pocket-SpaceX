//
//  LaunchInfoYoutubeHandlerProtocol.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

protocol LaunchInfoYoutubeHandlerProtocol {
    func attach(_ youtubeView: YTPlayerView)
    func setData(_ id: String)
}
