//
//  DataManager.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class DataManager {
        
    static func createDataForRockerInfo(_ data: RocketDatum) -> [String : String] {
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
    
    static func makeDateStringFromUnixTime(_ time: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(time))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "d MMMM yyyy HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}

