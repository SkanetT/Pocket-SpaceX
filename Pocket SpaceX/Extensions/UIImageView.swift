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
            self.image = nil
            return
        }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
        
    }
}
