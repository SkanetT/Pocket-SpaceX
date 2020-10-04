//
//  UIButton.swift
//  Pocket SpaceX
//
//  Created by Антон on 04.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

extension UIButton {
    
    func configureButton(title: String) {
        self.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.3607843137, blue: 0.8784313725, alpha: 1)
        self.setTitleColor(.white, for: .normal)
        self.setTitle(title, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.35
        self.layer.shadowOffset = .init(width: 5, height: 7)
        self.layer.shadowRadius = 10
    }
}
