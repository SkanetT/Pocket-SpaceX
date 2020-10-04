//
//  UIImageView.swift
//  Pocket SpaceX
//
//  Created by Антон on 12.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setKfImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            self.image = UIImage(systemName: "xmark.seal")
            return
        }
        self.kf.indicatorType = .activity
    self.kf.setImage(
    with: url,
    options: [
        .scaleFactor(UIScreen.main.scale),
        .transition(.fade(1)),
        .cacheOriginalImage
    ])
    }
    
    func cancelDownload() {
        self.image = nil
        self.kf.cancelDownloadTask()
    }
}
