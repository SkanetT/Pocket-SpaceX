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
    
    static func makeDateForTimer(_ time: Int) -> String {
        let currentTime = Int(Date().timeIntervalSince1970)
        let newTime = time - currentTime
        guard newTime > 0 else { return " 00 : 00 : 00  : 00 "}
        
        let dateLaunch = Date(timeIntervalSince1970: Double(time))
        let cc = Calendar.current.dateComponents( [.day, .hour, .minute, .second], from: Date(), to: dateLaunch)
        
        guard let day = cc.day, let hour = cc.hour, let minute = cc.minute, let second = cc.second else { return " 00 : 00 : 00  : 00 "}
        
        let days = plusZero(day)
        let hours = plusZero(hour)
        let minutes = plusZero(minute)
        let seconds = plusZero(second)
        
        let result = "\(days) : \(hours) : \(minutes) : \(seconds)"
        
        return result
    }
    
    private static func plusZero(_ number: Int) -> String {
        var result = ""
        if number < 10 {
            result = "0\(number)"
        } else {
            result = "\(number)"
        }
        return result
    }
    
    static func getVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        return version
    }
    
    static func getBuild() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let build = dictionary["CFBundleVersion"] as! String
        return build
    }
}
