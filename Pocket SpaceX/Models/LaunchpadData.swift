//
//  LaunchpadData.swift
//  Pocket SpaceX
//
//  Created by Антон on 26.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class LaunchpadRequest: BaseRequest<LaunchpadData> {
    
    override var path: String {
        return "/v4/launchpads"
    }
}

class LaunchpadInfoRequest: BaseRequest<LaunchpadDatum> {
    
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    override var path: String {
        return "/v4/launchpads/\(id)"
    }
}



typealias LaunchpadData = [LaunchpadDatum]

struct LaunchpadDatum: Codable {
    let name, fullName, locality, region: String
    let timezone: String
    let latitude, longitude: Double
    let launchAttempts, launchSuccesses: Int
    let rockets, launches: [String]
    let details, status, id: String

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case locality, region, timezone, latitude, longitude
        case launchAttempts = "launch_attempts"
        case launchSuccesses = "launch_successes"
        case rockets, launches, details, status, id
    }
}
