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
        guard newTime > 0 else { return "__ : __ : __  : __"}
        let days = DataManager.plusZero(newTime / 86400)
        let hours = DataManager.plusZero((newTime % 86400) / 3600)
        let minutes = DataManager.plusZero((newTime % 3600) / 60)
        let seconds = DataManager.plusZero((newTime % 3600) % 60)
        let result = "\(days) : \(hours) : \(minutes) : \(seconds)"
        return result
        
//        let launchTime: Double = 1609459200
//        let currentTime = Date()
//        let diff = Date(timeIntervalSince1970: launchTime).timeIntervalSince(Date())
//
//
//        let cc = Calendar.current.dateComponents([.year,.day,.hour,.minute,.second], from: Date(), to: Date(timeIntervalSince1970: launchTime))
//        print(cc.year)
//        print(cc.day)
//        print(cc.minute)

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
}

