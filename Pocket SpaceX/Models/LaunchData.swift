//
//  LaunchData.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

typealias LaunchData = [LaunchDatum]

struct LaunchDatum: Codable {
    let fairings: Fairings?
    let links: Links
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let tbd, net: Bool?
    let window: Int?
    let rocket: String
    let success: Bool?
    let failures: [Failure]
    let details: String?
    let crew, ships, capsules, payloads: [String]
    let launchpad: String
    let autoUpdate: Bool?
    let flightNumber: Int
    let name, dateUTC: String
    let dateUnix: Int
    let dateLocal: String
    let datePrecision: String
    let upcoming: Bool
    let cores: [Core]
    let id: String

   enum CodingKeys: String, CodingKey {
        case fairings, links
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case tbd, net, window, rocket, success, failures, details, crew, ships, capsules, payloads, launchpad
        case autoUpdate = "auto_update"
        case flightNumber = "flight_number"
        case name
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case upcoming, cores, id
    }
}

struct Core: Codable {
    let core: String?
    let flight: Int?
    let gridfins, legs, reused, landingAttempt: Bool?
    let landingSuccess: Bool?
    let landingType: LandingType?
    let landpad: String?

    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
        case landpad
    }
}

enum LandingType: String, Codable {
    case asds = "ASDS"
    case ocean = "Ocean"
    case rtls = "RTLS"
}

struct Failure: Codable {
    let time: Int
    let altitude: Int?
    let reason: String
}

struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: Bool?
    let ships: [String]

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered, ships
    }
}

struct Links: Codable {
    let patch: Patch
    let reddit: Reddit
    let flickr: Flickr
    let presskit: String?
    let webcast: String?
    let youtubeID: String?
    let article: String?
    let wikipedia: String?

    enum CodingKeys: String, CodingKey {
        case patch, reddit, flickr, presskit, webcast
        case youtubeID = "youtube_id"
        case article, wikipedia
    }
}

struct Flickr: Codable {
    let small: [String]?
    let original: [String]
}

struct Patch: Codable {
    let small, large: String?
}

struct Reddit: Codable {
    let campaign: String?
    let launch: String?
    let media, recovery: String?
}

