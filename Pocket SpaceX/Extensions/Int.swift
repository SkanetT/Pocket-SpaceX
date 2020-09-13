//
//  Int.swift
//  Pocket SpaceX
//
//  Created by Антон on 14.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

extension Int {
    
    func makeDate() -> String {
        let date = Date(timeIntervalSince1970: Double(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "d MMMM yyyy HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}
