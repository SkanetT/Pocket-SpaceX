//
//  Enums.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

enum LaunchType {
    case all
    case upcoming
    case past
}

enum RocketInfoOption: Int {
    case name
    case country
    case company
    case firstFlight
    case cost
    case mass
    case height
    case diameter
    case stages
    case boosters
    
    var description: String {
        switch self {
        case .name: return "Name"
        case .country: return "Country"
        case .company: return "Company"
        case .firstFlight: return "First flight"
        case .cost: return "Cost"
        case .mass: return "Mass (kg)"
        case .height: return "Height (meters)"
        case .diameter: return "Diameter (meters)"
        case .stages: return "Stages"
        case .boosters: return "Boosters"
        }
    }
}
