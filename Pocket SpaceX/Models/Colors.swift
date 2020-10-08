//
//  Colors.swift
//  Pocket SpaceX
//
//  Created by Антон on 08.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

enum Colors {
    static let blue = #colorLiteral(red: 0.262745098, green: 0.3607843137, blue: 0.8784313725, alpha: 1)
    static let red = #colorLiteral(red: 0.9254902005, green: 0.3437817532, blue: 0.3320597779, alpha: 1)
    static let green = #colorLiteral(red: 0.02862703306, green: 0.5, blue: 0.1270846961, alpha: 1)
    static let lowBlue = #colorLiteral(red: 0.7328770319, green: 0.8190480038, blue: 0.99563527, alpha: 1)
}

class ColorsGradient {
    var gl:CAGradientLayer

    init(colorTop: UIColor, colorBottom: UIColor) {

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}
