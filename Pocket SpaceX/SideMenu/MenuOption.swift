//
//  MenuOption.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

enum MenuOption: Int, CaseIterable {
    
    case rockets
    case starlink
    case launchpads
    case settings
    
    var description: String {
        switch self {
        case .rockets: return "Rockets"
        case .starlink: return "Starlink"
        case .launchpads: return "Launchpads"
        case .settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .rockets: return #imageLiteral(resourceName: "Rocket")
        case .starlink: return #imageLiteral(resourceName: "Satellite")
        case .launchpads: return #imageLiteral(resourceName: "Launchpad")
        case .settings: return UIImage(systemName: "gear") ?? UIImage()
        }
    }
    
}
