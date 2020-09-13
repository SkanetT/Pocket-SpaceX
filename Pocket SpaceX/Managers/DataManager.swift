//
//  DataManager.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    func createDataForRockerInfo(_ data: RocketDatum) -> [String : String] {
        var result: [String : String] = [:]
        result["Name"] = data.name
        result["Country"] = data.country
        result["Company"] = data.company
        result["First flight"] = data.firstFlight
        result["Cost"] = data.costPerLaunch.description
        result["Mass (kg)"] = data.mass.kg.description
        result["Height (meters)"] = data.height.meters?.description
        result["Diameter (meters)"] = data.diameter.meters?.description
        result["Stages"] = data.stages.description
        result["Boosters"] = data.boosters.description
        return result
    }
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
