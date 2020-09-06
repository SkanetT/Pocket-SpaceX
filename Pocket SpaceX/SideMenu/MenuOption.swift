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
    case landpads
    
    var description: String {
        switch self {
        case .rockets: return "Rockets info"
        case .landpads: return "Landpads"
        }
    }
    
    var image: UIImage {
        switch self {
        case .rockets: return UIImage(systemName: "person") ?? UIImage()
        case .landpads: return UIImage(systemName: "rectangle.grid.1x2") ?? UIImage()
        }
    }
    
}
