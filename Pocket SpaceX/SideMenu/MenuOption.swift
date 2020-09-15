//
//  MenuOption.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

enum MenuOption: Int {
    
    case rockets
    case starlink
    case launchpads
    
    var description: String {
        switch self {
        case .rockets: return "Rockets"
        case .starlink: return "Starlink"
        case .launchpads: return "Launchpads"
        }
    }
    
    var image: UIImage {
        switch self {
        case .rockets: return #imageLiteral(resourceName: "Rocket")
        case .starlink: return UIImage()
        case .launchpads: return UIImage(systemName: "rectangle.grid.1x2") ?? UIImage()
        }
    }
    
}
